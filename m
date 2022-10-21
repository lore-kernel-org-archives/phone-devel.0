Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69673C433FE
	for <phone-devel@archiver.kernel.org>; Fri, 21 Oct 2022 14:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiJUOhC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Oct 2022 10:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiJUOhA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Oct 2022 10:37:00 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF74254351
        for <phone-devel@vger.kernel.org>; Fri, 21 Oct 2022 07:36:59 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id h10so1923186qvq.7
        for <phone-devel@vger.kernel.org>; Fri, 21 Oct 2022 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JGMtp++eUJrez8pXYEPV6WEAnFwRbRNcptsUSZmXZKk=;
        b=GsGZuSfgkoadv7b/I2ks5EtBOIE8t2wfungIcWlrdh6fe45Zr6GSixCPHCHxofPeKL
         Fk6JE9sj96ws3+5HyHxkB0o4sWv9K2i/pISnK/KQ0DPyWB6g19CC/0s2Bs7CJhni5wRf
         wLbB+rqL7KQuDKi0UoFh4Mt9vNV+jtcIGjO8B2OPWWMGNDtQFFqGE1IZ/DajlrEepoTI
         G5+Edxq0i1oBrUbG1vxADhJbF/Qx9araR8SOvfm10CZRG8oLbUj6ZjUcgiBMcNwmLnQs
         M0Gu1Y/DAr9mkm7g3dR7drj7lTHJRnKsTCskbGHxjVczleqmF8DrB+Pg27oyPVgUR8gP
         i59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGMtp++eUJrez8pXYEPV6WEAnFwRbRNcptsUSZmXZKk=;
        b=heh1pBpcZQjgBLy/ng+5oPv5GSFfKfHPjJfiktSThO1qWVeftxg0sp0Vla/rnQLJNK
         WfJ5BwtZCbXzzFy1PzpzME31DOUkHAnBYbALTiC1VZM1TNJUGvzBgaW/yrZuB4rKbVgX
         nZ13EcJohvVWysp5BTWtWR1JkErwU4ThhJWmh0ondeQg5TrKpGiEs5GEvh0Qf21YZ0EX
         iaVZruuY5XggzdgHh9xSTEA/Jxpwd8bTlLjK7d4AvkV+/B6YtxTqB/PLAAh6uQV85LlN
         RGJp1ZDpGMr1miUDZooyGqgHtqq4t0e9rc2btZldAfRhaC+tyomMQ5sFvJOVMCzX7dMK
         jrhw==
X-Gm-Message-State: ACrzQf21jOHBw9mzjUs7de9hd1UAwyf42u5VYtKn8vKyneB/udVjixtr
        E7F8ai0IPoCjLjvTiFt9Wx4VvDcJYCMtbw==
X-Google-Smtp-Source: AMsMyM5VxtnCRA1go0k1ExMwMW9WYEP72w2A8FnkTd4/JdewFCbJWIw5uDCF2SgBtXifA6vuXEuvyA==
X-Received: by 2002:a05:6214:c68:b0:4b4:156a:cdac with SMTP id t8-20020a0562140c6800b004b4156acdacmr16489819qvj.115.1666363017979;
        Fri, 21 Oct 2022 07:36:57 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m21-20020ac866d5000000b0039cbd3e4ed1sm8074512qtp.6.2022.10.21.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 07:36:56 -0700 (PDT)
Message-ID: <38c21467-8970-eefa-7dd2-3f2ed3364afb@linaro.org>
Date:   Fri, 21 Oct 2022 10:36:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] arm64: boot: dts: msm8996: add blsp1_i2c6 node
Content-Language: en-US
To:     Harry Austen <hpausten@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221021142242.129276-1-hpausten@protonmail.com>
 <20221021142242.129276-3-hpausten@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021142242.129276-3-hpausten@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 21/10/2022 10:24, Harry Austen wrote:
> Add support for the sixth I2C interface on the MSM8996 SoC.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 31 +++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 80590267dfd0..70c0eae17360 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1400,6 +1400,20 @@ pwdn {
>  				};
>  			};
> 
> +			blsp1_i2c6_default: blsp1_i2c6 {

No underscores in node names.

Missing "state" suffix. See:
https://lore.kernel.org/linux-arm-msm/20221018155721.47140-1-krzysztof.kozlowski@linaro.org/

Bindings are already in next.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).


> +				pins = "gpio27", "gpio28";
> +				function = "blsp_i2c6";
> +				drive-strength = <16>;
> +				bias-disable;
> +			};
> +
> +			blsp1_i2c6_sleep: blsp1_i2c6_sleep {
> +				pins = "gpio27", "gpio28";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +

Best regards,
Krzysztof

