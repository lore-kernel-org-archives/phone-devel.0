Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B3CC61DA4
	for <phone-devel@archiver.kernel.org>; Mon,  6 Mar 2023 10:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbjCFKRS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 6 Mar 2023 05:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjCFKQw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 6 Mar 2023 05:16:52 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBD82658D
        for <phone-devel@vger.kernel.org>; Mon,  6 Mar 2023 02:16:13 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id r27so11962654lfe.10
        for <phone-devel@vger.kernel.org>; Mon, 06 Mar 2023 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678097771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=paCp4khLkdYCJvUBphf6ktJ3SAHLRMnfd3rJaSDQjJg=;
        b=TrvUFTR/WtcfqLb9S38CCzGVAWJ/A8Cav6XjxPuO/7YqsjNDTfrI7xf8obEmkm959H
         E9Od54Tb0OnvETDHKYd3csQK7aJHbRiL1PkLo55Kaliyjc/Sdq36Cg0Fzx4fU5i0a1Ss
         WX0ZLXcuMxmfELeUvIKApSvVvFpM88X8tOVnciP2qjXi6iVXvXksISSheipI03eS0Chr
         r2QgETTVwMWcoZwxWar8oCWO6G0IODfCyP6DiEnaWP7RQBm223PoxKaqQ3H/5LqxPC3S
         MNZVY1hX9QmDQDxW2YNS8Au+f1KjCBdjsxMqeQAZtw+ewybP4rX5OZVqIEqNI1RDJsKW
         bISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paCp4khLkdYCJvUBphf6ktJ3SAHLRMnfd3rJaSDQjJg=;
        b=wTAeyHbEPdSng6cmou8zD6fH6TUw3U6JO17fhg7EfbJD5TP/70b7T4pStRxCN1ipll
         5Mc2zzVddHCTlcgTyOCr9r9pnu0biQAjkhQUSXPZEfwIpWSSnU8BpfDtn7MjSYnQXPHw
         6EOlCM7KCSW0PW1M/yVqmIyP3Q+WoapXZ2/wJSyN8niKTt+RUlON1mVl5Lvw6HzjRB5K
         /TwKgs2W1629C82TAsQSrW2lPYz6IafaSSY8TOaq+tnGVx3X4rfwpPMhIiILu+3JafwE
         6wRUvlYGIUimns9zphrLBZFzpo21JpHnA0JxL3AKYBNw11pTPNrwDfK+skmlnsrE/2vI
         jzeg==
X-Gm-Message-State: AO0yUKWfFthO+Hm1fJ4DDsrSCfxnYi43nq3eyBHbXuIkPjnqZmesZH4t
        IFeotfBdvoUpKOMDEg7Oj9c4x8ujzCifyB3J/mw=
X-Google-Smtp-Source: AK7set9JoD1GPSyEKsQvG/aZ5mrlRi4d3ra+YudQAO1kv+CHIBzeFELvrtaAGqlFeb1mpSIW15ZISA==
X-Received: by 2002:ac2:51b3:0:b0:4d2:a821:5f1c with SMTP id f19-20020ac251b3000000b004d2a8215f1cmr2516617lfk.3.1678097771419;
        Mon, 06 Mar 2023 02:16:11 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004b4b5da5f80sm1566560lfl.219.2023.03.06.02.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:16:11 -0800 (PST)
Message-ID: <44a6fbdf-a2bc-2cb7-08e6-fb75e5fd97eb@linaro.org>
Date:   Mon, 6 Mar 2023 11:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] soc: qcom: rmtfs: fix error handling reading
 qcom,vmid
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230305-rmtfs-vmid-fix-v1-0-6a7206081602@z3ntu.xyz>
 <20230305-rmtfs-vmid-fix-v1-1-6a7206081602@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230305-rmtfs-vmid-fix-v1-1-6a7206081602@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 5.03.2023 11:32, Luca Weiss wrote:
> of_property_count_u32_elems returns a negative integer when an error
> happens , but since the value was assigned to an unsigned integer, the
> check never worked correctly. Also print the correct variable in the
> error print, ret isn't used here.
> 
> Fixes: e656cd0bcf3d ("soc: qcom: rmtfs: Optionally map RMTFS to more VMs")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soc/qcom/rmtfs_mem.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
> index 9d59ad509a5c7..218397ab0c36f 100644
> --- a/drivers/soc/qcom/rmtfs_mem.c
> +++ b/drivers/soc/qcom/rmtfs_mem.c
> @@ -176,7 +176,8 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  	struct reserved_mem *rmem;
>  	struct qcom_rmtfs_mem *rmtfs_mem;
>  	u32 client_id;
> -	u32 num_vmids, vmid[NUM_MAX_VMIDS];
> +	u32 vmid[NUM_MAX_VMIDS];
> +	int num_vmids;
>  	int ret, i;
>  
>  	rmem = of_reserved_mem_lookup(node);
> @@ -229,7 +230,7 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
>  
>  	num_vmids = of_property_count_u32_elems(node, "qcom,vmid");
>  	if (num_vmids < 0) {
> -		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", ret);
> +		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", num_vmids);
>  		goto remove_cdev;
>  	} else if (num_vmids > NUM_MAX_VMIDS) {
>  		dev_warn(&pdev->dev,
> 
