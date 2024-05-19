<style>
    body {
        background: #f8f9fa;
        font-family: Arial, sans-serif;
    }

    .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        border-radius: 15px;
        border: 1px solid black;
        margin-bottom: 20px;
    }

    .card:hover {
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
    }

    .copy-icon {
        cursor: pointer;
        color: #007bff;
        font-size: 0.9rem;
        margin-left: 5px;
    }

    .copy-icon:hover {
        color: #0056b3;
    }

    .redirect-url {
        font-size: 0.8rem;
        color: #142df8;
    }

    .redirect-url:hover {
        color: #0056b3;
        text-decoration: none;
    }

    .center-heading {
        text-align: center;
    }

    .me-2 {
        margin: 0 0 0 30px;
    }

    @media (max-width: 768px) {
        .me-2 {
            margin: 0;
        }
    }
</style>

<div class="container-fluid">
    <div class="container">
        <div class="row">
            <div class="col">
                
                <div class="row d-flex flex-column flex-md-row align-items-center">
                    <div class="col-md-8 mb-3 mb-md-0">
                        <h2 class="h5 mb-0">
                            <span class="text-muted center-heading" style="margin: 5px 0 0 5px;">Project Details</span>
                        </h2>
                    </div>
                    <div class="col-md-1 mb-2 mb-md-0">
                        <button class="btn btn-outline-danger w-100" id="project-status" type="button" data-id="{{ $projectsData->id }}">
                            <i class="fas fa-{{ $projectsData->status == 'Live' ? 'pause' : 'play' }}"></i>
                        </button>
                    </div>
                    <div class="col-md-1 mb-2 mb-md-0">
                        <a href="{{ url('admin/project/addedit') }}/{{ $projectsData->id }}" class="btn btn-outline-primary w-100">Edit</a>
                    </div>
                    <div class="col-md-2 mb-2 mb-md-0"> 
                        <span class="btn btn-outline-secondary w-100" id="duplicate" data-id="{{ $projectsData->id }}" style="cursor: pointer;">Duplicate</span>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body" style="height: 125px;">
                                <h5>Clicks</h5>
                                <hr>
                                <p><strong style="font-size: 30px;">{{ 0 }}</strong></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body" style="height: 125px;">
                                <h5>Completes</h5>
                                <hr>
                                <p><strong style="font-size: 30px;">{{ 0 }}</strong></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body" style="height: 125px;">
                                <h5>Terminates</h5>
                                <hr>
                                <p><strong style="font-size: 30px;">{{ 0 }}</strong></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4" style="margin-top: 20px;">
                    <div class="card-body">
                        <h5>Project info</h5>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Project Name: {{ $projectsData->name }}</strong></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Status: <span class="{{ $projectsData->status }}-status" id="status">{{ $projectsData->status }}</span></strong></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Client Name: {{ $projectsData->client_name }}</strong></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Project ID: {{ $projectsData->project_id }}</strong></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Cost Per Complete (CPI): ${{ $projectsData->cost_per_complete }}</strong></p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Maximum Completes (Limit): {{ $projectsData->max_limit }}</strong></p>
                            </div>
                        </div>
                        <p><strong>Live URL:</strong><br> <a href="{{ $projectsData->live_url }}" target="_blank" style="font-size: 1rem;" class="redirect-url">{{ $projectsData->live_url }}</a> <i class="fas fa-copy copy-icon"></i></p>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <h5>Description</h5>
                        <hr>
                        {!! $projectsData->description !!}
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body">
                        <!-- Additional content can go here -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="{{ asset('assets/admin/') }}/js/projects.js"></script>
