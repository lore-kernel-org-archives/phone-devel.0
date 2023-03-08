Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76B5C6FD1F
	for <phone-devel@archiver.kernel.org>; Wed,  8 Mar 2023 12:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjCHMdq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Mar 2023 07:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjCHMdp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Mar 2023 07:33:45 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD011B1EFB
        for <phone-devel@vger.kernel.org>; Wed,  8 Mar 2023 04:33:43 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id r27so21096603lfe.10
        for <phone-devel@vger.kernel.org>; Wed, 08 Mar 2023 04:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678278822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhaVVI8Pk6jsBYMTTZwOYmA0OkqSfPfRqSJgsvlWR0A=;
        b=uaLLOe+LSkgl3SEz4u/FHqZtFMo4rWuPMdrHzYTd1fSJjRlIRdjrVXVMMd5DhI4bfn
         MNUrAulMgaGghPavb9xJHYh4XP5Sl2xEXaIkrxET2OinzH4xrifP0V/zwmmh5g5mhxRz
         XHpLPDYGArYU8v4h2aZYX6L14h0MHZVXzUv8R97xLPKV+e4K/7Y/k1cYDOHOHhhinXG3
         N9O0XPycgqrZqD0xSlrFi+nrt2ZNkegwGCaHH50VBL4iM3UTbAp4FBxnW70Eh7e54X3g
         Th56Ua2oaeiWghC3fnFXtF/XLP+s+VYRFN02l6rizYhTj5/ULEB9o6af9c0thvd9v9Ru
         S6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhaVVI8Pk6jsBYMTTZwOYmA0OkqSfPfRqSJgsvlWR0A=;
        b=X6F2EE6BObtAaV3nAWxoNlLgWZ+thB02mcqZRRq9WYHd02sNF6iN4s4TeSjKYZeDSF
         ZcNohTdy64dKYU2gqnWsQGxzObBBgHFGztCeDQuct2/Shk2yp2Wx4n4c8Vyuww4iULYc
         SdEcS1cSSbLbTaG05g5mWN6lNVli1PMP3yWtJEm4Fkh0eKMRu1d3nMv1yUCiHNtgfiom
         rRKt78siHVc4Xyr2JKFN8waqYPtghxE0KcCOJW1voNmkEL4EPhfcKmwzN2cTOSEIvTlc
         6ilkLvF1VBcRP9N0kqPOsu9EjuLfVMD0f9DxOwOx7PGEemw9B37WjXq4lgzM4ORURImx
         QHwA==
X-Gm-Message-State: AO0yUKWATe4uRFyCtO9Lt2Eu1BD7SRfCzdubdepju/pG+otQWNKYE4gd
        c+IqmvE6FKnnTE2HRTGjxK8bsQ==
X-Google-Smtp-Source: AK7set9ZKLPMf6pQVimofwO7qW0KFvn3tzJdxJ0trKBorpusBuJT3MCj3un+UlZDWKJyVhG5QUlPcQ==
X-Received: by 2002:ac2:44d7:0:b0:4d8:68f5:747b with SMTP id d23-20020ac244d7000000b004d868f5747bmr4745902lfm.37.1678278821996;
        Wed, 08 Mar 2023 04:33:41 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id l7-20020ac24a87000000b004b5ab5e904esm2349754lfp.306.2023.03.08.04.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:33:41 -0800 (PST)
Message-ID: <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org>
Date:   Wed, 8 Mar 2023 13:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org> <ZAh3MSpQ30YyPAVe@Gentoo>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZAh3MSpQ30YyPAVe@Gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 8.03.2023 12:53, Jianhua Lu wrote:
> On Wed, Mar 08, 2023 at 12:13:53PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 8.03.2023 05:37, Jianhua Lu wrote:
>>> Add a driver for panels using the Novatek NT36523 display driver IC.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>> ---
>>> Changes in v3:
>>>   - Refactor source code
>>>
>>> Changes in v2:
>>>   - Refactor and clean up source code
>> This is a veeery vague changelog, akin to "change patch", please
>> be more specific the next time around.
>>
> Acked, thanks
>>
>> [...]
>>
>>> +#define DSI_NUM_MIN 1
>>> +
>>> +/* Macro modified from mipi_dual_dsi_dcs_write_seq */
>>> +#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)           	   \
>>> +	do {                                                               \
>>> +		static const u8 d[] = { cmd, seq };                        \
>>> +		int i, ret;                                                \
>>> +		for (i = 0; i < ARRAY_SIZE(dsi); i++) {                    \
>>> +			ret = mipi_dsi_dcs_write_buffer(dsi[i], d, ARRAY_SIZE(d));    \
>>> +			if (ret < 0) {                                             \
>>> +				dev_err_ratelimited(                               \
>>> +					&dsi[i]->dev, "sending command %#02x failed: %d\n", \
>>> +					cmd, ret);                                 \
>>> +				return ret;                                        \
>>> +			}                                                          \
>>> +		}                                                                  \
>>> +	} while (0)
>>> +
>> This should definitely be put in a common file..
> Acked.
>>
>>
>>> +static const struct drm_display_mode elish_boe_mode = {
>>> +	/* Current max freqency is 104HZ, TODO 120HZ */
>> Is it a DPU issue, or does the panel not work correctly when you
>> jack up the clocks? Did you use the correct init sequence and porches
>> for the 120Hz mode, including the mode switch command set?
>>
> panel will turn into bluescreen when freqency overs 104HZ, downstream
> seems use a dsi-cphy enhance feature to make it working. Init sequence
> and porches are right
Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

phy-type:
    description: D-PHY (default) or C-PHY mode
    enum: [ 10, 11 ]
    default: 10

try setting that to 11 under your DSI PHYs (or one? not sure).

Konrad
> 
>> Could you also implement a 60 (or whatever other value is also
>> implemented downstream) Hz mode?
> I will try to implement it.
>>
>>> +	.clock = (1600 + 60 + 8 + 60) * (2560 + 26 + 4 + 168) * 104 / 1000,
>>> +	.hdisplay = 1600,
>>> +	.hsync_start = 1600 + 60,
>>> +	.hsync_end = 1600 + 60 + 8,
>>> +	.htotal = 1600 + 60 + 8 + 60,
>>> +	.vdisplay = 2560,
>>> +	.vsync_start = 2560 + 26,
>>> +	.vsync_end = 2560 + 26 + 4,
>>> +	.vtotal = 2560 + 26 + 4 + 168,
>>> +};
>>> +
>>> +static const struct drm_display_mode elish_csot_mode = {
>>> +	/* Current max freqency is 104HZ, TODO 120HZ */
>>> +	.clock = (1600 + 200 + 40 + 52) * (2560 + 26 + 4 + 168) * 104 / 1000,
>>> +	.hdisplay = 1600,
>>> +	.hsync_start = 1600 + 200,
>>> +	.hsync_end = 1600 + 200 + 40,
>>> +	.htotal = 1600 + 200 + 40 + 52,
>>> +	.vdisplay = 2560,
>>> +	.vsync_start = 2560 + 26,
>>> +	.vsync_end = 2560 + 26 + 4,
>>> +	.vtotal = 2560 + 26 + 4 + 168,
>>> +};
>>> +
>>> +static const struct panel_desc elish_boe_desc = {
>>> +	.modes = &elish_boe_mode,
>>> +	.dsi_info = {
>>> +		.type = "NT36523",
>> That's a bit vague, the driver IC is not very telling about the
>> panel itself. Since we're not able to determine much more information,
>> this could contain the panel manufacturer and the device name.
> Acked.
>>
>>> +		.channel = 0,
>>> +		.node = NULL,
>>> +	},
>>> +	.width_mm = 127,
>>> +	.height_mm = 203,
>>> +	.bpc = 8,
>>> +	.lanes = 3,
>>> +	.format = MIPI_DSI_FMT_RGB888,
>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
>>> +	.init_sequence = elish_boe_init_sequence,
>>> +	.is_dual_dsi = true,
>>> +};
>>> +
>> [...]
>>
>>> +static int nt36523_probe(struct mipi_dsi_device *dsi)
>>> +{
>> [...]
>>
>>> +	/* If the panel is dual dsi, register DSI1 */
>>> +	if (pinfo->desc->is_dual_dsi) {
>>> +		info = &pinfo->desc->dsi_info;
>>> +
>>> +		dsi1 = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
>>> +		if (!dsi1) {
>>> +			dev_err(dev, "cannot get secondary DSI node.\n");
>>> +			return -ENODEV;
>>> +		}
>>> +
>>> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
>>> +		of_node_put(dsi1);
>> Shouldn't you put the reference only if it's found?
> thanks for spot it.
>>
>>> +		if (!dsi1_host) {
>>> +			dev_err(dev, "cannot get secondary DSI host\n");
>>> +			return -EPROBE_DEFER;
>> dev_err_probe, here and in neighbouring exit return paths?
> Acked.
>>
>>
>> Konrad
