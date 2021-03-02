Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E77C433E0
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C981760C41
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350418AbhCBNs1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Mar 2021 08:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbhCBCK1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 1 Mar 2021 21:10:27 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AD4C061222
        for <phone-devel@vger.kernel.org>; Mon,  1 Mar 2021 18:05:09 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id p16so20084690ioj.4
        for <phone-devel@vger.kernel.org>; Mon, 01 Mar 2021 18:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YuUOZilAPqtQ1SZQR/vTqn0A0mCysPgz4pmCeU7TVwA=;
        b=CSXUqM6rGhHKiQX2k8GL6zA4oMI4IxoVfDmGlYXBm2crqJfK0V5wqHl/US8WkpZ0Ak
         F++JeQlUo36xDmY1/EAjeu6lPL9vMzW2hsEAb23KK7C/VpVEsyVCQY3SPE6xXISgEtT7
         Px/dEzdrPFrlgENwv+uq4DE/Soj11T57VRLnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YuUOZilAPqtQ1SZQR/vTqn0A0mCysPgz4pmCeU7TVwA=;
        b=ewmpyxmcMTsDUlZnJGJjxt9SoGiN6MvYK7RGltqg27T8jpn1kX140yMrjOEHCT/igd
         M6dLTPtHRZbwGjzAt7YMiw1boQExwym+PuxhNYH7WP5RlYpziuSRQu7N51o7KYQIAHS2
         VoSIvzeuv66pWrrSJEO3kqxGB2yRF9QyO74fV6Uii0VjybSTMYXGD6VaaOqe8eGx8Vy6
         BfrBM3w59pwFsMoTotS+xAO8juctsmIzCfcF6ZvYTapGJmsaTIL80JpC0Y17nfuA2z3a
         rwm7cIxXflTfIBfcqBG+fYiBckajLkl16hgvS8onlNWHDeVuLcOAwb6kiIT9kP0KPfUU
         OVyg==
X-Gm-Message-State: AOAM531YJn9jTK/w4wHiNv4O/Ku/k+6foa9pGMSYh1y4KqUuwySHvly4
        byOq/+epvLZQKWRCB77EpyqPEG2SiMqN3J41
X-Google-Smtp-Source: ABdhPJwCRrdGCnsEA1cgycV1Nefbv3RWZiKM6W4aDW+mGlSmGj069gmdSe+Z46hECvP08Gsux5qADQ==
X-Received: by 2002:a5e:cb4b:: with SMTP id h11mr16540014iok.108.1614650708781;
        Mon, 01 Mar 2021 18:05:08 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id h13sm10921008ioe.40.2021.03.01.18.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 18:05:08 -0800 (PST)
Subject: Re: [PATCH v1 2/7] net: ipa: endpoint: Don't read unexistant register
 on IPAv3.1
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
 <20210211175015.200772-3-angelogioacchino.delregno@somainline.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <73d19c5a-fddb-05d8-4787-de613091cbeb@ieee.org>
Date:   Mon, 1 Mar 2021 20:05:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211175015.200772-3-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2/11/21 11:50 AM, AngeloGioacchino Del Regno wrote:
> On IPAv3.1 there is no such FLAVOR_0 register so it is impossible
> to read tx/rx channel masks and we have to rely on the correctness
> on the provided configuration.

This works, and is simple.

I think I would rather populate the available mask here
with a mask containing the actual version-specific available
endpoints.  On the other hand, looking at the downstream code,
it looks like almost any of these endpoints could be used.

So, while I don't know for sure the all-1's value here is
*correct*, it's more of a validation check anyway, so it's
probably fine

					-Alex

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/net/ipa/ipa_endpoint.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 06d8aa34276e..10c477e1bb90 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -1659,6 +1659,15 @@ int ipa_endpoint_config(struct ipa *ipa)
>  	u32 max;
>  	u32 val;
>  
> +	/* Some IPA versions don't provide a FLAVOR register and we cannot
> +	 * check the rx/tx masks hence we have to rely on the correctness
> +	 * of the provided configuration.
> +	 */
> +	if (ipa->version == IPA_VERSION_3_1) {
> +		ipa->available = U32_MAX;
> +		return 0;
> +	}
> +
>  	/* Find out about the endpoints supplied by the hardware, and ensure
>  	 * the highest one doesn't exceed the number we support.
>  	 */
> 

