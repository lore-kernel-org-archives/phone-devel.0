Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944CDC77B7F
	for <phone-devel@archiver.kernel.org>; Mon,  8 May 2023 09:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbjEHJEh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 May 2023 05:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjEHJEf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 May 2023 05:04:35 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3377222F64
        for <phone-devel@vger.kernel.org>; Mon,  8 May 2023 02:04:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f14468ef54so4851387e87.0
        for <phone-devel@vger.kernel.org>; Mon, 08 May 2023 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536653; x=1686128653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D42a7kAufHFfCa6DzYqq9rm/TxDnXtpvnsBtGOs13Lg=;
        b=gLrP/o3C4+pIl5CHu4LwxWhj4a5Z660ax6pM5LbXmWQvl0nzOZbHPD45rDP6EHAYWH
         chts8zALFfq8tx+S6o+NBRoEhlWFJmXHGYxzAoRV/uyKe8Y1+T74IEig4lVqERRKDS7u
         U7/ii5My0GJAn+uhB3Y2dC/lgirApjY29Sts6m8vploPxZG2owK8VlfRmJ+BbE0uaghJ
         rfjJy4KbKTLfwtup2aRRNcOhFbxQXRUnneNvyHoJ325bueMpMgK+/i1dvkd7rAQjQS9W
         gM7m5HNl/kmVC6ziPjaUGUjCtGqogI1XJsLGjzpnIt3DsxUxczGzL6VXgK1f3nD8ZFSF
         6xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536653; x=1686128653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D42a7kAufHFfCa6DzYqq9rm/TxDnXtpvnsBtGOs13Lg=;
        b=KDGpw+8jZjMOe/YBPcEU0IBKdytj27B+lPkWiOf3yngSlHN084GDmbHGVWHQdXwJ7D
         aWVF1KMa1+YHZI7M8cLazMhaFLWrGIWRXRL0J9Wn2o/r9h5v9MeyjZZ4N4vAB+fxQmlE
         G6aJoySUgumMfEsmr9OawtI2AnlouMdYBRnLa6C+y18bPa49hk33di25cctzvqtbHFIZ
         uJMKIh4H1exUIL6mY4lGNx1csDu/aRp8f2O/Ljso3M/hF66l7JQpd2N2MC4owL47RMR4
         vKC3QbZwFKIN5vEV0/xAnOQ0aWyQ+UpU+3eLo4hTF+ruKupMKiIQ6aq6JLcHUv5DtDm+
         NoGw==
X-Gm-Message-State: AC+VfDyP6ST3KQtdhVqRL+DDMfUGhlxMw9yhI/+43Rg5h6TOeCRuRv7W
        3J5GUNZFkZxssih/Ctn+Sa8kjg==
X-Google-Smtp-Source: ACHHUZ6Pmir8tqnHTctE+1q6bNM6SLhDzlYu46FW6Okmw6mwRV9D6jU66WRahVgOaXRs0S3dRcaUTQ==
X-Received: by 2002:a05:6512:502:b0:4f1:477c:f8a9 with SMTP id o2-20020a056512050200b004f1477cf8a9mr2321884lfb.65.1683536653369;
        Mon, 08 May 2023 02:04:13 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id w12-20020a056512098c00b004f13c3cb9ffsm1228381lft.200.2023.05.08.02.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:04:12 -0700 (PDT)
Message-ID: <fa090b66-07df-4477-c573-d63c47162585@linaro.org>
Date:   Mon, 8 May 2023 11:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] dt-bindings: nvmem: qfprom: Add compatible for
 MSM8226
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-2-matti.lehtimaki@gmail.com>
 <168349474323.3488480.15689407694158704570.robh@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <168349474323.3488480.15689407694158704570.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 7.05.2023 23:25, Rob Herring wrote:
> 
> On Sun, 07 May 2023 23:12:19 +0300, Matti Lehtimäki wrote:
>> Document QFPROM compatible for MSM8226.
>>
>> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> 
> doc reference errors (make refcheckdocs):
> Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
> MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml
Rob, your bot seems to have picked up a false positive

Konrad
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230507201225.89694-2-matti.lehtimaki@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
