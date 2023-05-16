Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1925C77B75
	for <phone-devel@archiver.kernel.org>; Tue, 16 May 2023 01:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjEPBRu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 15 May 2023 21:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjEPBRu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 15 May 2023 21:17:50 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA3D198B
        for <phone-devel@vger.kernel.org>; Mon, 15 May 2023 18:17:48 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ac7c59665bso146609151fa.3
        for <phone-devel@vger.kernel.org>; Mon, 15 May 2023 18:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684199867; x=1686791867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WACwJGv8gsOQeDW3ZaDiXX7Fzl5vd3342+yL7YL6Kn8=;
        b=hARnqa4yEveffmwYihTWwU3aHHPP9wSW4Bk/52TvRcJZZrf17eGrVV6eJ5ws5HJrF7
         IPN/04lnFUg+5zP/JYRwFWKppQtWVVKHAksORVM2srLjiJOb0jUEsEhcZ9tTi0n2PPOK
         plAflzLYHkR9CI7NziTyqRaWuzkc9F4qDyhOOxWCg5ulCljUE7lLrx1aeGsCg7wqf5Aa
         2H+HBgr4xATalp1m4+ve4pY1gEd6a96jau8p2KPVty42EBt5BcfeIw133KbT2VeTFGWv
         gJVsCXgcdwGhaa/ZqAk56noXdPEEjpb8wmGfiNearKWE94GOqm1aie3ZJ+OEnw6AiF5W
         03Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684199867; x=1686791867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WACwJGv8gsOQeDW3ZaDiXX7Fzl5vd3342+yL7YL6Kn8=;
        b=KUaVVDQZt/cKBDnqlOLutmqbiMcnMUoHDIXuPGU8b8zuFtMoZANqd4x3O1E36yzrR9
         lnna0T72AGNRRnf89UlLVW9ZJy/jUfdnG2RiUVcaiCWuu35AdlaXRD3RpNccssVfIgwb
         cQjk/oFJDCpoGij9H1Ahp7iUoV0de7NzKaFqhRFfkClujJXB24iKNgRinMp8u2uIHkfX
         zoTG/RID6JGVV+drx/oIwioFvXAlzG6vEnGChUdCJrsXj9MKYwxZhRSK8PVYb/buUz61
         SrSY1ZXW50bdipiKhxLYA+c4WVNzpv9DVRdfO4sJcQpDzGA7RW6apAhD1j2QZzTEn0Ds
         zL/A==
X-Gm-Message-State: AC+VfDzGGbzD7X8CKyDG0x23mYCLhwgAh0QSMOi5bNC0buo9LRKa1FEh
        /qRgjgPhGKJ9l7Exhdlp3ixQmw==
X-Google-Smtp-Source: ACHHUZ4JNYC7Doy3Hnr2LE6tTJvsIEpXocwMqY7PIXE8ZRt4GhDn7EK5Y/rjvycBw00KaOj7K/nV5w==
X-Received: by 2002:a2e:9916:0:b0:2ac:53f7:41d6 with SMTP id v22-20020a2e9916000000b002ac53f741d6mr7391563lji.49.1684199866814;
        Mon, 15 May 2023 18:17:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y19-20020ac24473000000b004efe8991806sm2786742lfl.6.2023.05.15.18.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 18:17:46 -0700 (PDT)
Message-ID: <27108475-a482-dc2c-67e4-ee573090a524@linaro.org>
Date:   Tue, 16 May 2023 03:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] ARM: dts: qcom: msm8226: Add ocmem
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-6-3e24e2724f01@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-6-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 7.05.2023 11:12, Luca Weiss wrote:
> Add a node for the ocmem found on msm8226. It contains one region, used
> as gmu_ram.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 42acb9ddb8cc..7ad073eb85c8 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -636,6 +636,23 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		sram@fdd00000 {
> +			compatible = "qcom,msm8226-ocmem";
> +			reg = <0xfdd00000 0x2000>,
> +			      <0xfec00000 0x20000>;
> +			reg-names = "ctrl", "mem";
> +			ranges = <0 0xfec00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>;
> +			clock-names = "core";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			gmu_sram: gmu-sram@0 {
> +				reg = <0x0 0x20000>;
> +			};
> +		};
>  	};
>  
>  	timer {
> 
