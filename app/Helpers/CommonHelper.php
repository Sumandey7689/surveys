<?php

use Illuminate\Mail\Message;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\View;



if (!function_exists('pre')) {
    function pre($data)
    {
        echo "<pre>";
        print_r($data);
        echo "</pre>";

    }
}

if (!function_exists('date_ymd')) {

    function date_ymd($date)
    {

        if ($date != "") {
            $date = str_replace('/', '-', $date);
            $date = date("Y-m-d", strtotime($date));
        } else {
            $date = NULL;
        }

        return $date;
    }
}

if (!function_exists('date_dmy_to_ymd')) {
    function date_dmy_to_ymd($date)
    {
        $dateEx = explode('/', $date);
        $month = $dateEx[1];
        $day = $dateEx[0];
        $year = $dateEx[2];
        $stringDate = $day . "-" . $month . "-" . $year;
        $formated_date = date("Y-m-d", strtotime($stringDate));
        return $formated_date;
    }
}

// if (!function_exists('sendEmail')) {
//     function sendEmail($to, $subject, $content, $data = [], $cc = [], $bcc = [], $attachments = [])
//     {
//         try {
//             Mail::send([], $data, function (Message $message) use ($to, $subject, $content, $cc, $bcc, $attachments) {
//                 $message->to($to)
//                     ->subject($subject)
//                     ->setBody($content, 'text/html');
//                 if (!empty ($cc)) {
//                     $message->cc($cc);
//                 }

//                 if (!empty ($bcc)) {
//                     $message->bcc($bcc);
//                 }

//                 foreach ($attachments as $attachment) {
//                     $message->attach($attachment);
//                 }

//             });

//             return true;

//         } catch (\Exception $e) {
//             return $e;
//         }
//     }
// }

if (!function_exists('sendEmail')) {
    function sendEmail($to, $subject, $content, $data = [], $cc = [], $bcc = [], $attachments = [])
    {
        try {
            // Render the view content to a string if necessary
            if ($content instanceof Illuminate\View\View) {
                $content = $content->render();
            } elseif (is_string($content)) {
                $content = View::make($content, $data)->render();
            }

            Mail::send([], $data, function ($message) use ($to, $subject, $content, $cc, $bcc, $attachments) {
                $message->to($to)
                        ->subject($subject);

                // Set the body content as HTML
                $message->html($content); // For HTML content

                // Add CC recipients if any
                if (!empty($cc)) {
                    $message->cc($cc);
                }

                // Add BCC recipients if any
                if (!empty($bcc)) {
                    $message->bcc($bcc);
                }

                // Attach files if any
                foreach ($attachments as $attachment) {
                    $message->attach($attachment);
                }
            });

            return true;
        } catch (\Exception $e) {
            return $e->getMessage(); // Return the exception message for debugging
        }
    }
}