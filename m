Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D2DC00140
	for <phone-devel@archiver.kernel.org>; Mon,  8 Aug 2022 08:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbiHHIml (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Aug 2022 04:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbiHHImk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Aug 2022 04:42:40 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0331B7CE
        for <phone-devel@vger.kernel.org>; Mon,  8 Aug 2022 01:42:37 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c17so11661049lfb.3
        for <phone-devel@vger.kernel.org>; Mon, 08 Aug 2022 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GH1RTNvYltddRQxOqOLKUQpIVt1WCGJQQLNGxCMK7OQ=;
        b=mXenbGDo9bRNDtEOPVQu0RF4n4RJmJUOGuPf8+Ji11hejTu+YltiW7jOc6CacZZJ3K
         ++onYF5D45cuwq7aFFBQCfBMe7f8UuGC1yfEIHcpuOvg46FLKm2Mg7gHjlyOTVE/A4pE
         alfOdj2kJ3fCVsYAPVz2yUWMJDB2NqET8ZdUTsSSySW4l4pTWC6014VWjedDyySetJ/W
         lXQgw3E4rhzQoiEA7W7bArsIOf/DqVCFaVYZMQusOCNtBLuZfgRG0uklvGuHNbDY1qvq
         SNUCaw+HiyZ+XRfgMHSOFzrDMjIFgQxMgfAe+n4fMm4Y+lSj69hVecGr2984x6Nm1NDP
         +c9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GH1RTNvYltddRQxOqOLKUQpIVt1WCGJQQLNGxCMK7OQ=;
        b=rvMWqR7iTR+5kI+yfqBe80Q8NTGTyiZF9VMh4iASp8IL6QVOEy0KzACu6OsO1DlZC4
         esTutwJmH0cuYRe0KKo6vYXNUFJ/hXi8HxcRpzk5OX8OoElcCl6TqageE0/mkTrF4g60
         lQsiy1XYQT7LYvVAsyJwk3AOIZKKSzBRvEgZTLwrjTVjPeqWKsUGh0LK/QsaebNpQw5Q
         0SzJF8IicV67T8RYMGjzSWT9O8NrcBgGX38j6HMBEgk1kYB0tN8ixIXI2ug4+aoTqsub
         uAAZODX4/YMXQWNCjMdU8Pe/2xMJdZGvzQeQs6VUtXFfP0RSCoMXk7DTJNwhPrmGk6tz
         TGyA==
X-Gm-Message-State: ACgBeo1E/P2YuUSLS0kKliyGv/8KzvTmf/6zh0OwRLzy6Zi2y1MKsVeU
        +VXlQZTF87Pd+dgRUJThjNUS7g==
X-Google-Smtp-Source: AA6agR7uQdUhuZnAdiC5tKssODVVFuEx+vi//6BMEw7GMy7C6AlLLIZm1wj0fY3KlYnhtYrXSRrvvw==
X-Received: by 2002:ac2:42ce:0:b0:48a:9d75:b733 with SMTP id n14-20020ac242ce000000b0048a9d75b733mr6480370lfl.510.1659948156065;
        Mon, 08 Aug 2022 01:42:36 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id d23-20020a056512369700b0048b18d65998sm1352612lfs.38.2022.08.08.01.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 01:42:35 -0700 (PDT)
Message-ID: <dfaf7a35-25bb-8201-42bc-73ca280fcb69@linaro.org>
Date:   Mon, 8 Aug 2022 11:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/8] dt-bindings: power: supply: Add DT schema for
 Qualcomm SMBCHG
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220808073459.396278-1-y.oudjana@protonmail.com>
 <20220808073459.396278-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808073459.396278-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/08/2022 10:34, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT schema for the switch-mode battery charger found on Qualcomm
> PMICs such as PMI8994. Due to lack of documentation, some interrupt
> descriptions might be inaccurate.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/power/supply/qcom,smbchg.yaml    | 205 ++++++++++++++++++
>  MAINTAINERS                                   |   8 +
>  2 files changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smbchg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smbchg.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smbchg.yaml
> new file mode 100644
> index 000000000000..d825a9c10b3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,smbchg.yaml
> @@ -0,0 +1,205 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/qcom,smbchg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMIC Switch-Mode Battery Charger
> +
> +maintainers:
> +  - Yassine Oudjana <y.oudjana@protonmail.com>
> +  - Alejandro Tafalla <atafalla@dnyon.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pmi8994-smbchg
> +      - qcom,pmi8996-smbchg
> +
> +  reg:
> +    maxItems: 1
> +
> +  monitored-battery:
> +    description: |
> +      phandle of battery characteristics node.
> +      The charger uses the following properties:
> +      - charge-term-current-microamp
> +      - constant-charge-current-max-microamp
> +      - voltage-max-design-microvolt
> +      The constant-charge-current-max-microamp and voltage-max-design-microvolt
> +      properties must be set.
> +      See Documentation/devicetree/bindings/power/supply/battery.yaml
> +
> +  interrupts:
> +    items:
> +      - description: Charger error
> +      - description: Charger inhibited
> +      - description: Charger precharge safety timer timeout
> +      - description: Charger charge safety timer timeout
> +      - description: Charger pre to fast charging switch threshold reached
> +      - description: Charger recharge threshold reached
> +      - description: Charger taper threshold reached
> +      - description: Charger charge termination threshold reached
> +      - description: Battery hot
> +      - description: Battery warm
> +      - description: Battery cold
> +      - description: Battery cool
> +      - description: Battery overvoltage
> +      - description: Battery low
> +      - description: Battery missing
> +      - description: Battery thermistor missing # unconfirmed
> +      - description: USB input undervolt
> +      - description: USB input overvolt
> +      - description: USB input source detected
> +      - description: OTG regulator failure
> +      - description: OTG regulator overcurrent
> +      - description: Automatic input current limiting done
> +      - description: USB ID pin changed
> +      - description: DC input undervolt
> +      - description: DC input overvolt
> +      - description: Power OK
> +      - description: Temperature shutdown
> +      - description: Watchdog timeout
> +      - description: Flash failure
> +      - description: OTST2 # unknown
> +      - description: OTST3 # unknown

It seems you listed register interrupts, not physical pins. This should
be interrupt lines.

Best regards,
Krzysztof
