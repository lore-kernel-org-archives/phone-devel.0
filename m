Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E19C433E0
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 19:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8970523B1A
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 19:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbhANTTp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:19:45 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:52429 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbhANTTp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 14:19:45 -0500
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 555BE3EB7A;
        Thu, 14 Jan 2021 20:19:02 +0100 (CET)
Subject: Re: [PATCH v3 1/2] arm64: dts: sdm845: add oneplus6/6t devices
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210114185227.25265-1-caleb@connolly.tech>
 <20210114185227.25265-2-caleb@connolly.tech>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <17d49d19-7672-520c-12d3-c6ed8c12ae47@somainline.org>
Date:   Thu, 14 Jan 2021 20:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114185227.25265-2-caleb@connolly.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi!

>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb

Please sort.

> +/ {
> +
Redundant newline.
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_down_gpio &volume_up_gpio>;
> +
> +		vol-down {
> +			label = "Volume down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&pm8998_gpio 5 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +
> +		vol-up {
> +			label = "Volume up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +	};
Perhaps gpio-keys could come before the fixed regulators to keep it a bit more sane/sorted?
> +&adsp_pas {
This should come before apps_rsc alphabetically.
> +// Prevent garbage data on bluetooth UART lines
Please use C-style comments (/* thing */).
> +&usb_1 {
> +	status = "okay";
> +
> +	/*
> +	 * disable USB3 clock requirement as the device only supports
> +	 * USB2.
> +	 */
> +	qcom,select-utmi-as-pipe-clk;
> +};
> +
> +&usb_1_dwc3 {
> +	/*
> +	 * We don't have the capability to switch modes yet.
> +	 */
> +	dr_mode = "peripheral";
> +
> +	/* fastest mode for USB 2 */
> +	maximum-speed = "high-speed";
> +
> +	/* Remove USB3 phy as it's unused on this device. */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +};

Are you sure you can't get USB3 in host mode? Perhaps it's not worth discarding it upfront, as some boards can do that, definitely do check!

> \ No newline at end of file

Please add a newline.


The DTS files look correct, but don't you need at least one of msm-id, board-id, pmic-id? I'm not exactly sure what OnePlus does, but I can imagine they would require such properties..


Konrad

