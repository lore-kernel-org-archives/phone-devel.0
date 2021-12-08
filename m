Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3048DC433EF
	for <phone-devel@archiver.kernel.org>; Wed,  8 Dec 2021 13:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234289AbhLHNeL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Dec 2021 08:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbhLHNeL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Dec 2021 08:34:11 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3295FC0617A2
        for <phone-devel@vger.kernel.org>; Wed,  8 Dec 2021 05:30:39 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id s11so2170878ilv.3
        for <phone-devel@vger.kernel.org>; Wed, 08 Dec 2021 05:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iWfBbC7QhR5OPwWGNWFkv98J0dCoDSaq0A4LB4NYFN8=;
        b=gf4o0MMp0qkVQAUuJxCHXHTFGP82gITzRvHtqK+aKS1A58gZeKUN1tTNF1XyKHTKum
         U3LIf6q0TSABwK2hw6+NdfUzF5t9s3h8MMbfyXB+Q4Q6xCUBZqJYO5jkH2sqZoOvJpu1
         UinD1XaYhOzC1Ev5ERdf+jjjOuw7THwr3DcQmBCw6cyyji4Qv5FagOg6PpIZKvEd3+UH
         De1AyZMa3nEbGV3YGKylerbld36ce2XtOdX419AOykNGLrz43HBNr8xX+TROXThtjIvr
         dIcDJqFJqNCiTjwKZG6ZL2BXYBXqpvhC+uB3QMqS3Ent4RyG3YcxASnauWg1ot+anB1L
         75lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iWfBbC7QhR5OPwWGNWFkv98J0dCoDSaq0A4LB4NYFN8=;
        b=Wy7R4LbvRrSDeo2y5FkOIwYk6r2niuu7ryawnA8VZcrPjY1kTYEqcHrlutEspGZG0l
         aYyGxaQm2F/m3If1NoPXVKE+yghaajlys7xy1milffisLP+JyV2kwGQv6/JBlgdflfQN
         TLE+pGxi9ar+0AYpe2YOD9g4lNN8f2dPXBUcSy/MtH+Zl6CyjCuA/YqYMn+nM4G69XFR
         xvFr5sxFXl09MliEdcS8aUaD2YAgxm/EpMTM8XBHRDi7ypf6Nzu/NzG439aJEe/eQpph
         /2CHBxJ0tmVNCKmrvkqj6VeR/rx4knXiZto0/5vRhW3xizDBpCEKSwnk2pIAas2Irb5K
         zUwQ==
X-Gm-Message-State: AOAM530YKD8vXkF3iOweNE5AYlqj5WbYbEEGR2Yf3dvuv+FyW5RAuQZE
        RjsgZ1TRQEqVfAUXgLWaJYA1Bw==
X-Google-Smtp-Source: ABdhPJw/1qZee6e0QouIINRk3opN8f9rvzGBPmi9P3MeuDSRjqUHFSwvCXCCbZb9HmXy48q4HZigMw==
X-Received: by 2002:a05:6e02:2191:: with SMTP id j17mr6341614ila.120.1638970238491;
        Wed, 08 Dec 2021 05:30:38 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id b8sm2198305ilj.0.2021.12.08.05.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 05:30:37 -0800 (PST)
Message-ID: <6ec5aa90-6a7c-0efe-558f-44c5cde8ca14@linaro.org>
Date:   Wed, 8 Dec 2021 07:30:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Add function to set IOMMU
 pagetable addressing
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211208083423.22037-1-marijn.suijten@somainline.org>
 <20211208083423.22037-4-marijn.suijten@somainline.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20211208083423.22037-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/8/21 2:34 AM, Marijn Suijten wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add a function to change the IOMMU pagetable addressing to
> AArch32 LPAE or AArch64. If doing that, then this must be
> done for each IOMMU context (not necessarily at the same time).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> [Marijn: ported from 5.3 to the unified architecture in 5.11]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Are there no users of this function?	-Alex

> ---
>   drivers/firmware/qcom_scm.c | 16 ++++++++++++++++
>   drivers/firmware/qcom_scm.h |  1 +
>   include/linux/qcom_scm.h    |  1 +
>   3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index d5a9ba15e2ba..6f7096120023 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1140,6 +1140,22 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
>   }
>   EXPORT_SYMBOL(qcom_scm_hdcp_req);
>   
> +int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMMU_PROGRAM,
> +		.cmd = QCOM_SCM_SMMU_PT_FORMAT,
> +		.arginfo = QCOM_SCM_ARGS(3),
> +		.args[0] = sec_id,
> +		.args[1] = ctx_num,
> +		.args[2] = pt_fmt, /* 0: LPAE AArch32 - 1: AArch64 */
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +
> +	return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL(qcom_scm_iommu_set_pt_format);
> +
>   int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
>   {
>   	struct qcom_scm_desc desc = {
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index bb627941702b..a348f2c214e5 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -120,6 +120,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>   #define QCOM_SCM_LMH_LIMIT_DCVSH		0x10
>   
>   #define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
> +#define QCOM_SCM_SMMU_PT_FORMAT			0x01
>   #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>   #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
>   
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 8a065f8660c1..ca4a88d7cbdc 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -108,6 +108,7 @@ extern bool qcom_scm_hdcp_available(void);
>   extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
>   			     u32 *resp);
>   
> +extern int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt);
>   extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
>   
>   extern int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
> 

