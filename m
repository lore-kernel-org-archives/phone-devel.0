Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B921C07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbiIZIsM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234535AbiIZIry (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:47:54 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD25B275D0
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:47:51 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id t7so9029752wrm.10
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=k26OHege7nClrzpMsFYqAQhF+1lIRKPFJJQ+FxPasVQ=;
        b=U3II0SNA+O1gIRfrl1LJ8fObf4THNZhcB/uVCPIdZifP7+iq6SBBGN6FvXAK1vbMmh
         u4KcAmLklVUHGD/GWvaTo1DiF+GAo0HhmiItn11l0mG6EvY/OCUkYi/sPbMqUg1Dq58w
         OphMctLMR1HCUYXzUwHuDEwcKjXWcgh+0tvFBR6kyYkKrL0jYi95b8/9A12KHi2K0Soh
         89liANtDAJMY7Q6DhB3j+VjWMa97BKzgqTSIC6GvUPqPncKritns83xSGvNf5RKdsbnR
         1QCZfRVhhbWe1gm5qlOm88gobEvCgC9p8Wxa/Db0BDSbPz1odnSR73HI366USALhGn0H
         YTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=k26OHege7nClrzpMsFYqAQhF+1lIRKPFJJQ+FxPasVQ=;
        b=xQg6ERqFLqpuGfwCE/nuTBftrN0YMwJmuaC9/cUWr6F1dn0L6FoduDB88hA7Ynpx4c
         U8zwTtyr4dAwXKhfydN6zub4XmZWT4PilGqYSJ1Clb6smgxh/tRXolkY5w18n9vkwZnj
         v2aMjFXhahOpRqEbvceyfw3Lvai3Zg+MGzWPqNVnF7PoGJOTASRxlOv3/0SUfnr7nU8k
         DACCDJEs7ZvFsJ0lobC8afm5HJlPjWq7YEloos4CnHoRdGcFuuuqpIXVY7/WVbkWwqLL
         UMHwsO3gBBC05P//JyECsSey3ar+mR9OJzfhCeuSbhNpDviXFRpx6c1Cm9H29CHkGipN
         x8Rw==
X-Gm-Message-State: ACrzQf2WkT6Zv525V8Q30J7cx/L8fhEoSlUcOu7OQhgfLDcICFYSgISV
        HlNphQawdLtJ7jdKbXVC+8QQ5A==
X-Google-Smtp-Source: AMsMyM7lULrCXOjtyujy+kwySUM5uVFODjN4eQilhqQq6gedAbAdYaP9n2qCt8ZyjAg7ppOWoH88Jg==
X-Received: by 2002:a5d:6d0e:0:b0:22a:7bb2:14ae with SMTP id e14-20020a5d6d0e000000b0022a7bb214aemr13239303wrq.379.1664182071416;
        Mon, 26 Sep 2022 01:47:51 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c4d0700b003b4e009deb2sm11628445wmp.41.2022.09.26.01.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:47:50 -0700 (PDT)
Message-ID: <0ddb678a-6e7c-6316-9bee-8742e0c1fbca@linaro.org>
Date:   Mon, 26 Sep 2022 10:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: Align dsi phy-names with
 schema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
 <20220925172443.92900-2-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925172443.92900-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 19:24, Luca Weiss wrote:
> Use dsi instead of dsi-phy as required by the binding.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index a831064700ee..48f4b4deb8b1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1046,7 +1046,7 @@ dsi0: dsi@1a98000 {
>   					      "pixel",
>   					      "core";
>   				phys = <&dsi_phy0>;
> -				phy-names = "dsi-phy";
> +				phy-names = "dsi";
>   
>   				#address-cells = <1>;
>   				#size-cells = <0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
