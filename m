Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACC8C433FE
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 11:26:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76CDC61104
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 11:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235739AbhIIL1K (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Sep 2021 07:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235455AbhIIL1J (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Sep 2021 07:27:09 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE87C061575
        for <phone-devel@vger.kernel.org>; Thu,  9 Sep 2021 04:26:00 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F0413EEA8;
        Thu,  9 Sep 2021 13:25:58 +0200 (CEST)
Subject: Re: [PATCH 2/7] arm64: dts: qcom: msm8998-xperia: Add RMI4
 touchscreen support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-2-angelogioacchino.delregno@somainline.org>
 <YTdsBg78ErgxqFXy@ripper>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <8c817fed-ebc3-c269-ee00-bdef12f707af@somainline.org>
Date:   Thu, 9 Sep 2021 13:25:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YTdsBg78ErgxqFXy@ripper>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Il 07/09/21 15:41, Bjorn Andersson ha scritto:
> On Fri 03 Sep 11:09 PDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> All of the devices in the Sony Yoshino platform are using a Synaptics
>> RMI4-compatible touch IC with identical pins and supplies: enable the
>> I2C-5 bus and add the rmi4-i2c node along with the required pin
>> configurations.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 60 +++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> index b07cbc759807..2fe53e4675d5 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
>> @@ -30,6 +30,15 @@ board_vbat: vbat-regulator {
>>   		regulator-boot-on;
>>   	};
>>   
>> +	touch_vddio_vreg: touch-vddio-vreg {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "touch_vddio_vreg";
>> +		startup-delay-us = <10000>;
>> +		gpio = <&tlmm 133 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ts_vddio_en>;
>> +	};
>> +
>>   	vph_pwr: vph-pwr-regulator {
>>   		compatible = "regulator-fixed";
>>   		regulator-name = "vph_pwr";
>> @@ -134,6 +143,42 @@ ramoops@ffc00000 {
>>   	};
>>   };
>>   
>> +&blsp1_i2c5 {
>> +	status = "okay";
>> +	clock-frequency = <355000>;
>> +
>> +	touchscreen: synaptics-rmi4-i2c@2c {
> 
> "touchscreen" sounds like a better "generic name" for the node.
> 
> Haven't checked the following patches yet, do you need the label?
> 

Thank you, I forgot to remove the label after a cleanup.
Also, node name changed.

Cheers,
- Angelo

> Regards,
> Bjorn
> 
>> +		compatible = "syna,rmi4-i2c";
>> +		reg = <0x2c>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&ts_int_n>;
>> +
>> +		vdd-supply = <&vreg_l28_3p0>;
>> +		vio-supply = <&touch_vddio_vreg>;
>> +
>> +		syna,reset-delay-ms = <220>;
>> +		syna,startup-delay-ms = <1000>;
>> +
>> +		rmi4-f01@1 {
>> +			reg = <0x01>;
>> +			syna,nosleep-mode = <1>;
>> +		};
>> +
>> +		rmi4-f11@11 {
>> +			reg = <0x11>;
>> +			syna,sensor-type = <1>;
>> +		};
>> +	};
>> +};
>> +
>> +&blsp1_i2c5_sleep {
>> +	bias-disable;
>> +};
>> +
>>   &blsp2_uart1 {
>>   	status = "okay";
>>   };
>> @@ -448,6 +493,21 @@ hall_sensor0_default: acc-cover-open {
>>   		drive-strength = <2>;
>>   		input-enable;
>>   	};
>> +
>> +	ts_int_n: ts-int-n {
>> +		pins = "gpio125";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	ts_vddio_en: ts-vddio-en-default {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		bias-disable;
>> +		drive-strength = <2>;
>> +		output-low;
>> +	};
>>   };
>>   
>>   /*
>> -- 
>> 2.32.0
>>

