Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA196C77B7A
	for <phone-devel@archiver.kernel.org>; Tue, 30 May 2023 10:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjE3KwY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 30 May 2023 06:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjE3KwX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 30 May 2023 06:52:23 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42FFCD
        for <phone-devel@vger.kernel.org>; Tue, 30 May 2023 03:52:21 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso44789885e9.2
        for <phone-devel@vger.kernel.org>; Tue, 30 May 2023 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685443940; x=1688035940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8nDMmF4Rh/Bd+3WSVAUVjbCxPcVcJxjYrTTKFRXjQU=;
        b=Iz6D0NJ9GiwWAnNbVNcYPRQp1/nDJGM6uiQ3d8ME2qjRhYpFokvrj3HXZO+ucf1bGW
         d9Ffq98ymGW2mawVpYeqCS/f6tS+kYzrljXLPuZHvKBCtdF00m4WiEa05Hpx7/aIp8jI
         H/udGK/kVmlyGfrPFR+W9iw3tYJ5YIABvC/f6nju4JgkKX9m9dRzAWsMwLAP4kTEhn0k
         P4LO1tGnOqCYEcLSkZKRERpSDk6G3YFcKAYu97Pgo6Pv7ey5LirN3tAgmlRTlKSunvzF
         iE5rTPan4HUXqkvZNTzZ9nL2CXlSLU5jOvYZh6NebzV6UXx7fnl/QJGwCrA/S4FZ9a7M
         Oo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443940; x=1688035940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8nDMmF4Rh/Bd+3WSVAUVjbCxPcVcJxjYrTTKFRXjQU=;
        b=RRsKSbK+sNwr9Szq7b98vQFdyX/Z1cI52zjJAvc14q0JHEmE75l2NDbDys7jm4mx+u
         TF8y/qjau1MHvrSy8/MDyg1mm0olNTiQcswNIdKOLi2FSGQwtLgTCqbg8UgqaOechk37
         KAUqGC/6Mccp9JIqUYV6e/5vtv0V2FG1H9tXc6aM1ruCGTWg26043gmwQN1o7l69ZQBV
         bwTMaOl5w6CTpNOw/aFzbid3h3FXdcA6dr3Ry/h1kE1Z7NtkAQrAZRBjGn+6n7lQOop3
         H+Nezz2c1+fw0o0HqiQw1C8Nd7GLqygS0Dcm44JQe9ERVMsWf0iVAh4ZgBD4ODm12T6N
         Cgiw==
X-Gm-Message-State: AC+VfDwvRVyV8aUDhoC5g9GeOQkTpa0axSlIDHHZD2ZzcGhNN0imOcCg
        Ga0DA+pNsXSh9ycfYW/FuvwVyg==
X-Google-Smtp-Source: ACHHUZ7EeQU6wTwePyW5SsSph7bmWmzBh+YfoN1Ytx0QPg1J133jcsV49lUTfOYqjFJIGBKh6l84JA==
X-Received: by 2002:a7b:cbc8:0:b0:3f6:3ad:16a with SMTP id n8-20020a7bcbc8000000b003f603ad016amr1741490wmi.31.1685443940263;
        Tue, 30 May 2023 03:52:20 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id j18-20020a5d4492000000b002ffbf2213d4sm2870418wrq.75.2023.05.30.03.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:52:19 -0700 (PDT)
Message-ID: <e0365591-0f03-ab3d-61b4-c016541f2157@linaro.org>
Date:   Tue, 30 May 2023 11:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] misc: fastrpc: support complete DMA pool access to
 the DSP
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dan.carpenter@linaro.org,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Ekansh Gupta <quic_ekangupt@quicinc.com>
References: <20230511141146.30465-1-me@dylanvanassche.be>
 <20230511141146.30465-2-me@dylanvanassche.be>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230511141146.30465-2-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/05/2023 15:11, Dylan Van Assche wrote:
> To support FastRPC Context Banks which aren't mapped via the SMMU,
> make the whole reserved memory region available to the DSP to allow
> access to coherent buffers.

Mapping the whole region sounds very inefficient, and also possibly 
making the cma region not usable by others.

> 

AFAIU SDM845 does not have any context banks for SDSP. All new SoCs 
after 865 have moved to having a context bank.

For such cases (w/o cb) we can make fastrpc_session_alloc use channel 
context device instead of session ctx device. As this is going to be an 
issue when we try to allocate buffers dynamically for that cb.

In the newer platforms (from 865) there is support for iommu and context 
banks on SDSP, so the existing code flow is identical for both ADSP and 
SDSP.


We should be careful not to break newer platfroms while adding support 
to this.

Both myself and Ekansh thought about this and see that the better way to 
add support to this is by

1. extend fastrpc_session_alloc() to support zero context banks.

2. add flags to mark this and allocate meta data using secure allocation 
when its required based on this flag.

3.  buffer allocation can either go with 2 or with a new flag coming 
from userspace.



> This is performed by assigning the memory to the DSP via a hypervisor
> call to set the correct permissions for the Virtual Machines on the DSP.
> This is only necessary when a memory region is provided for SLPI DSPs
> so guard this with a domain ID check.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/misc/fastrpc.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f48466960f1b..1ced553ae959 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2231,6 +2231,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   	int i, err, domain_id = -1, vmcount;
>   	const char *domain;
>   	bool secure_dsp;
> +	struct device_node *rmem_node;
> +	struct reserved_mem *rmem;
>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>   
>   	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2274,6 +2276,19 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   		}
>   	}
>   
> +	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> +	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> +		rmem = of_reserved_mem_lookup(rmem_node);
> +		if (!rmem) {
> +			err = -EINVAL;
> +			goto fdev_error;
> +		}
> +
> +		qcom_scm_assign_mem(rmem->base, rmem->size, &data->perms,
> +				    data->vmperms, data->vmcount);

vmperms need to be a bit field.

> +
> +	}
> +
>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>   	data->secure = secure_dsp;
>   

--srini
