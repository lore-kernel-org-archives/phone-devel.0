Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9280FC433FE
	for <phone-devel@archiver.kernel.org>; Sat, 12 Feb 2022 16:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237502AbiBLQiR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 12 Feb 2022 11:38:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbiBLQiQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 12 Feb 2022 11:38:16 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C91240BE
        for <phone-devel@vger.kernel.org>; Sat, 12 Feb 2022 08:38:12 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 22138405EC
        for <phone-devel@vger.kernel.org>; Sat, 12 Feb 2022 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644683891;
        bh=X3PaDMR8+PfNCu9HSVeF64I3rmiKpfgBp/WxGyhnalg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MVSLS90vai7rl3TQcUNRAzoysoU+PC1QMpSjJQF2cmwfTFiSqpMAfoUO8FmfQTJYc
         yztDqhK1xQ2KLxpoRu0VTZ+sB+TLxvP8A7TTy8GpcZX8YjADdD8t6pTIOTatQZJxDl
         BEcwipw5/RrkcsKLUVNh6CY+2fPrH/qC2+/T2Tzj8tKDOUGNaJAeLyelJTK6tyFIRc
         SW3vr4VpX6BdD/oZi+an/E8nfM1FWWYO7lajQtSQyICym1Y46lAqSCOwZsXSisM+HM
         cSsKe4SgWsIU+I1NApTxf7n2aSdGyhoV7z9TtSBw0xIAvNlEqL7Al/WoAyLMMcC1qB
         2wB3MbeKVcl8g==
Received: by mail-ej1-f71.google.com with SMTP id m4-20020a170906160400b006be3f85906eso4879013ejd.23
        for <phone-devel@vger.kernel.org>; Sat, 12 Feb 2022 08:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X3PaDMR8+PfNCu9HSVeF64I3rmiKpfgBp/WxGyhnalg=;
        b=0ZHYv5dUcstxhQaS8Rd2KeKt6w3bzWvU1c1eNs+O7wiR3n281Ay92D3X+NKFGmXstf
         I+Nqfx8PudrTrLKvQKD7cFtsDiv1lAAPddQf3J5FQofJ4rqcolMr+i/vOjFk0Tk1Hl+V
         rktNWuz+pI7ywAHmKJAd+6fv/J2AhGQYyWBQ19W95t5bQNjqwcln9eyvZd/ji/zcDPFu
         groTVQLR9/Z4kSfA4CMEAWYpkOZitV6eNBiQUDL1TPEFMeehhF0n+rPq2WHi77uSLsLb
         MBqokIuUTPOxHWgR01r2TIOfKgEIz9mEu5Cola9evigyI088SsU2s/M9KNVMKM/a1jp+
         GAFA==
X-Gm-Message-State: AOAM5325LOzh9XafjQJHsLJKBfhvS3ekGgRktYjBGmxtfbmmvFpxLJSG
        umKDl2UTROCSCy4i3GPKX3P4zbUSRfco23RKsaMfpSpG7ow+QYWAgdGH42bWyW00hT+F8kPgAK4
        0k/FSHyqt0F7dZZuXeLLcFzQdJhh1Gs21VpnSh6K7
X-Received: by 2002:a05:6402:278c:: with SMTP id b12mr7210728ede.103.1644683890414;
        Sat, 12 Feb 2022 08:38:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi2LSEQvl7xb62/E1vnFojUOYRyBbFs5bpXETqx/QohvA7v+RAEx4arYWWSVBGLcFKJkv64w==
X-Received: by 2002:a05:6402:278c:: with SMTP id b12mr7210710ede.103.1644683890187;
        Sat, 12 Feb 2022 08:38:10 -0800 (PST)
Received: from [192.168.0.101] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id fd21sm290486ejc.44.2022.02.12.08.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Feb 2022 08:38:09 -0800 (PST)
Message-ID: <59c02065-7da9-4665-9038-82b3b6bda339@canonical.com>
Date:   Sat, 12 Feb 2022 17:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/1] arm64: dts: exynos: Add initial device tree
 support for Exynos7885 SoC
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220206231816.127650-1-virag.david003@gmail.com>
 <20220206231816.127650-2-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220206231816.127650-2-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/02/2022 00:18, David Virag wrote:
> Add initial Exynos7885 device tree nodes with dts for the Samsung Galaxy
> A8 (2018), a.k.a. "jackpotlte", with model number "SM-A530F".
> Currently this includes some clock support, UART support, and I2C nodes.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Remove address-cells, and size-cells from dts, since they are
>     already in the dtsi.
>   - Lower case hex in memory node
>   - Fix node names with underscore instead of hyphen
>   - Fix line breaks
>   - Fix "-key" missing from gpio keys node names
>   - Use the form without "key" in gpio key labels on all keys
>   - Suffix pin configuration node names with "-pins"
>   - Remove "fimc_is_mclk" nodes from pinctrl dtsi for now
>   - Use macros for "samsung,pin-con-pdn", and "samsung,pin-con-pdn"
>   - Add comment about Arm PMU
>   - Rename "clock-oscclk" to "osc-clock"
>   - Include exynos-syscon-restart.dtsi instead of rewriting its contents
> 
> Changes in v3:
>   - Fix typo (seperate -> separate)
> 
> Changes in v4:
>   - Fixed leading 0x in clock-controller nodes
>   - Actually suffixed pin configuration node names with "-pins"
>   - Seperated Cortex-A53 and Cortex-A73 PMU
> 
> Changes in v5:
>   - Use "-gpio-bank" suffix in gpio bank nodes
>   - Remove interrupts from gpio-keys
>   - Move oscclk clock-frequency to board dts
>   - Seperate cmu_core clock names into 4 lines
>   - Use EXYNOS5420_PIN_DRV_LVx macros
>   - Add missing include from pinctrl dtsi
>   - Drop decon pinctrl nodes
>   - Order pinctrls by addresses
> 
>  arch/arm64/boot/dts/exynos/Makefile           |   7 +-
>  .../boot/dts/exynos/exynos7885-jackpotlte.dts |  93 ++
>  .../boot/dts/exynos/exynos7885-pinctrl.dtsi   | 855 ++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 440 +++++++++
>  4 files changed, 1392 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7885.dtsi
> 

Tried to apply and there was a conflict in Makefile, so this looks like
based on something wrong. Patches should be based on maintainer's tree,
which can be easily achieved by basing just on linux-next.

Anyway, I fixed the conflicts but it fails new pinctrl schema (already
in next) with few errors. This looks like the same error exynos850 had:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=daeb1c2b50fb98118d6318b5fdbd9ef9bdfaeaf5
also maybe:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=f377d4d4beafca755d2b6e6368895b1f3fb383c6

DTSI or schema might need adjustement.

> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index b41e86df0a84..c68c4ad577ac 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_EXYNOS) += \
> -	exynos5433-tm2.dtb	\
> -	exynos5433-tm2e.dtb	\
> -	exynos7-espresso.dtb	\
> +	exynos5433-tm2.dtb		\
> +	exynos5433-tm2e.dtb		\
> +	exynos7-espresso.dtb		\
> +	exynos7885-jackpotlte.dtb	\

Please rebase.

>  	exynosautov9-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> new file mode 100644
> index 000000000000..d707dba906d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Galaxy A8 2018 (jackpotlte/SM-A530F) device tree source
> + *
> + * Copyright (c) 2021 Samsung Electronics Co., Ltd.
> + * Copyright (c) 2021 Dávid Virág
> + *

No need for blank line.

> + */
> +
> +/dts-v1/;
> +#include "exynos7885.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Samsung Galaxy A8 (2018)";
> +	compatible = "samsung,jackpotlte", "samsung,exynos7885";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &serial_0;
> +		serial1 = &serial_1;
> +		serial2 = &serial_2;
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_2;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3da00000>,
> +		      <0x0 0xc0000000 0x40000000>,
> +		      <0x8 0x80000000 0x40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_volup &key_voldown &key_power>;
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa1 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&serial_2 {
> +	status = "okay";
> +};
> +
> +&pinctrl_alive {
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa1-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa1-7";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};
> +
> +&oscclk {

Order overriden nodes alphabeticall by label name, so (ossclk,
pinctrl_alive, serial).

Best regards,
Krzysztof
