Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466E2C77B62
	for <phone-devel@archiver.kernel.org>; Fri, 31 Mar 2023 09:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjCaJGd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 31 Mar 2023 05:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbjCaJGQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 31 Mar 2023 05:06:16 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119C01EFC2
        for <phone-devel@vger.kernel.org>; Fri, 31 Mar 2023 02:05:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c29so28039354lfv.3
        for <phone-devel@vger.kernel.org>; Fri, 31 Mar 2023 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ww+xs5zSITqJiRhg1TZBjG0j5TGWUo2itIzsjqmCoR0=;
        b=M8Vca+6sZ/dBj08OF2TyONjm/DyJsSK2LTMAosNPF24asEggjr6WYAP9ex4CgaDOoc
         HTdW+YjJZRsqoCoI14Pn5Otgc7bEAzPzULB4+2M2EOcPoZErxKRsiPec0Ah5YjFwVdZI
         RDgtVX3ZUjpM+TAWWmc16lcdR4vz9TuJK4LPJZZiadvU+npt3sAceJZCxlYtp5FU7JAs
         2YGPq5wrVpUW5Rsd4TCFniKtZzpUuXsMk70GO0TF0kPMX0LaTw9SlTVFiQnutjo78Sh4
         7q6iYmxhFHDMARQIvWfUhR+y1Ox3VCf6KlbUPf/B9D8R7y7Fmo+Oo75Biq6qq4fLltXY
         9O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww+xs5zSITqJiRhg1TZBjG0j5TGWUo2itIzsjqmCoR0=;
        b=i7CrZCNBbg8nyfHml3gBHMcOg5FZ1cbij0nU5WbqNQ8yjkLsRqW1Ebu6h+aSL8HM2/
         VFxB+m8twDktNrenGL8/GVpSSW3WHkEUV176c8R2IgCF4xsrz5S0EdUXhzU+APvS9MKk
         Nv92+/obThaCiFcJXnaXK6FhFACc9JGN8yuYxM80QSXBKZkYAaYzIEKoN3QUlSKrDBpH
         dlflYRicF6H0gcFMuXcQR708wsHSO5mTvp8jhztsr9Gr1XDHTxsjJ90XWQ1OCDoGZvMz
         AGbKy0ge/q4uTVCTSq/Drh3Rr42N2GAXAQYUn8ws2s9cYDInQLxxx2C69a6RLKEFhu1r
         taKA==
X-Gm-Message-State: AAQBX9e5vC2mIWyZjqO7sj13XhBpgwFYTqbOttoIXsBr+sqVOujiJeI7
        RIWrY7pwt9abjS1axz7rFL5uqQ==
X-Google-Smtp-Source: AKy350aX+7g6BXXHJEUjGVjWtEPTqj5kdJ+73eQgKkbwqs7CDqVQ6ZwCEDckvr3yCy4hqaz7/bAplg==
X-Received: by 2002:ac2:48a1:0:b0:4eb:2a26:babf with SMTP id u1-20020ac248a1000000b004eb2a26babfmr1427388lfg.0.1680253549568;
        Fri, 31 Mar 2023 02:05:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13-20020ac25d6d000000b004eb12329053sm291432lft.256.2023.03.31.02.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:05:49 -0700 (PDT)
Message-ID: <6cab9930-1222-e715-be1d-ffdc44713aa8@linaro.org>
Date:   Fri, 31 Mar 2023 11:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/4] dts: arm64: qcom: sdm845: add SLPI remoteproc
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230330165322.118279-1-me@dylanvanassche.be>
 <20230330165322.118279-2-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330165322.118279-2-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/03/2023 18:53, Dylan Van Assche wrote:
> Add the SLPI remoteproc to the SDM845 Qualcomm SoC which is responsible
> for exposing the sensors connected to the SoC. The SLPI communicates
> over GLink edge 'dsps' and is similar to other DSPs e.g. ADSP or CDSP.
> This patch allows the SLPI to boot and expose itself over QRTR as
> service 400.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2f32179c7d1b..3b547cb7aeb8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3311,6 +3311,42 @@ glink-edge {
>  			};
>  		};
>  
> +		slpi_pas: remoteproc@5c00000 {

This does not look like correct place. Are you sure you followed the
order by unit address?



Best regards,
Krzysztof

