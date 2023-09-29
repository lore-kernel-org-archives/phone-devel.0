Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC9EE743FA
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 08:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbjI2IoW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 04:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbjI2In5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 04:43:57 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F62E10D9
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:43:49 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40652e5718cso14591115e9.3
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695977027; x=1696581827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rp1s3Cc6q3I+T5FJVJHZiDlmNzAU9w/FLuJ7hihiwMM=;
        b=Kev7qdyDbfV0PuiAmVc4soJBmzZdk/mduOoXAzXHKnjHQQV1kTR6+jLlbC84ZtQdAo
         aHMxH513OEpTjgExCfa+XZb57lSxBIVEOpQbbdpDRmIIzKfAJemdmZPwamiaE+Lq853M
         cT2xQs336asEyk8EA+m6Ub82IYVl/F6Bpu/ZGqQo4cW4gP286zK5i4StpgRCI1d6yFY+
         N4VTfB3+P58ud8CmlvSDPAcRnmOcuErXtL+4rUn0tSk9RwSyIOCx3uKJGYwdtyGKQywD
         MJZz7ac8JFwW+O4GBVWJuNycuYt5046Mpvg2W9laFgPnP+CK6QGKfr4AqYsyWL5Tk7cc
         WNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977027; x=1696581827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp1s3Cc6q3I+T5FJVJHZiDlmNzAU9w/FLuJ7hihiwMM=;
        b=W6TOpOzB6HmUi+iVHo5ZH/R6nNKewVr7gtES8eWua9+7bwoRLcCUlrBIULQ/YJ/qHO
         L1retL86nt5uinSabzmejXOonHwPGsmsw+mJZc2gJKjalllogi3MLrUjuk4uNcABWj35
         v1TJ3jJHfPUARsVyQdH4FPtqlTz6Ujj5Fqr0VL9zs1RYYMq0ogyUR9jJk5AwQxUrq5J8
         PDsGxOz36odX0FCWve70wDVDZcNsiELUwpvBpIi05Ot4l8qSYBzSWj4kTa2OC5OG77qS
         v9iTfzFbTXuXYs8lx3TeFZeOSMIF4Z3eOfncFVaBEWbZSdON5n/XC/Qqfgf8UYL0UfkU
         N0Ww==
X-Gm-Message-State: AOJu0YzGcMkDDRQICyw9lDkSvHlAdBYVw7uU+Hrz59CgNPoSPHhNxU/e
        CxHZ8qDfmbUt+Si9s/uxwjSKWQ==
X-Google-Smtp-Source: AGHT+IGwhDUE56Q/LmypNp76kDCQmaKpYWqYnLhqhoVI2+et2l65D8wf54XUidmiN018A3eQsslWJQ==
X-Received: by 2002:a1c:7209:0:b0:403:cab3:b763 with SMTP id n9-20020a1c7209000000b00403cab3b763mr3252182wmc.33.1695977027437;
        Fri, 29 Sep 2023 01:43:47 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d4a8b000000b0031ffb51f6f9sm21113634wrq.30.2023.09.29.01.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 01:43:47 -0700 (PDT)
Message-ID: <91fa3315-b3da-430d-bc3c-7ec5ccbf419c@linaro.org>
Date:   Fri, 29 Sep 2023 09:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
 <20230929-sc7280-venus-pas-v1-2-9c6738cf157a@fairphone.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230929-sc7280-venus-pas-v1-2-9c6738cf157a@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 29/09/2023 09:38, Luca Weiss wrote:
> If the video-firmware node is present, the venus driver assumes we're on
> a non-TZ system. Move the video-firmware node to chrome-common.dtsi so
> we can use venus on a TZ board.
> 
> At the same time let's disable the venus node by default as is custom on
> such nodes.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
>   2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> index 5d462ae14ba1..cd491e46666d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> @@ -104,6 +104,14 @@ &scm {
>   	dma-coherent;
>   };
>   
> +&venus {
> +	status = "okay";
> +
> +	video-firmware {
> +		iommus = <&apps_smmu 0x21a2 0x0>;
> +	};
> +};
> +
>   &watchdog {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 66f1eb83cca7..fa53f54d4675 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
>   				 <&apps_smmu 0x2184 0x20>;
>   			memory-region = <&video_mem>;
>   
> +			status = "disabled";
> +
>   			video-decoder {
>   				compatible = "venus-decoder";
>   			};
> @@ -3748,10 +3750,6 @@ video-encoder {
>   				compatible = "venus-encoder";
>   			};
>   
> -			video-firmware {
> -				iommus = <&apps_smmu 0x21a2 0x0>;
> -			};
> -
>   			venus_opp_table: opp-table {
>   				compatible = "operating-points-v2";
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
