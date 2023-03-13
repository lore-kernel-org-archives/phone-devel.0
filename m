Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF24C6FD1F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Mar 2023 08:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjCMIIw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Mar 2023 04:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjCMIIi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Mar 2023 04:08:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5125597
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 01:06:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q16so10388163wrw.2
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694812;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9T+gkmJSh/A2WDenopQxXDLhV/ur6paK/JrT18X4nWg=;
        b=Iv2G+78gmnXK8UQXnG5coj7nchQy0urUJWA33kXXuQCkEHq0M8FyQVkN9fuD3d/Lxz
         oz7w8I4FDjvTlXPGpV0pu6GAyV/JtBXyAUEHwpZgC7TPrI5W7CpKUwPifVBWfzulZMvt
         UseUIx6NL6dsyRGuyYmqz7d5kuC0by3WjL4QimOraxJXHBUh/Lct2FtU1RjVjMs/HVhx
         Jx6QteCrEAMRnK0UfN63xCVZCW55Xgq97f1A1sLzcTqvyJZrL/95+ChN8oZPJbVkiEpp
         bKA5wN1wvxvLWFKFT7TYp6wyxS5wSZ+dW0R+ZkUAQFO7B2ftfkgxFoP5Gtc8Pffkt0Iq
         wjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694812;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9T+gkmJSh/A2WDenopQxXDLhV/ur6paK/JrT18X4nWg=;
        b=D8XEGB6EqfGgv56IWxn4+BERBNZMJoIlqgjQq8NqRAGRFwBDgb6Hmfbu04UyzHwJeT
         E4qGaf5vsIoeOHcaRPNuG0MUSXZkMl0XR71r+mT8AzqV2/Dg3hpnycR1Rw2lnkolytDL
         6H6vkHoWgqI/YJqDBa5sDJ4rUVVBPM2HAui3RF/xxpoQqqdZfSR611jJafJvV7xw1ori
         a1FF6qDJKeCrMYwj8h2Kd7oJthiF4d2VYkK2M9k6ahKn9MmDfizd0lX4XNwVbmAFfoRn
         DVos/GNeFRCcz93SdhgwkWYT/YyZxqSa00NgYJb/vbHPvKolVk/8JKBQ46wtDRsqkozv
         IMFQ==
X-Gm-Message-State: AO0yUKV3eUfFJK20AEc34bh69oN14JDVZdRgh2lh9fESSYxj9TPorsFw
        mj2jHEFbf0zC26D/rQ7LzE3g/g==
X-Google-Smtp-Source: AK7set+szlV9cCWtDnSfEmND682iNy8nj0kpvAQc7fC4DpuzG1k9PBJAPBfXxESaTRweKTfRFyKB6Q==
X-Received: by 2002:adf:ee90:0:b0:2c8:9cfe:9e29 with SMTP id b16-20020adfee90000000b002c89cfe9e29mr20978010wro.38.1678694812121;
        Mon, 13 Mar 2023 01:06:52 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id x1-20020adff641000000b002c70c99db74sm7124861wrp.86.2023.03.13.01.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:06:51 -0700 (PDT)
Message-ID: <6c02557d-372d-05b1-2998-7c2cde99fac7@linaro.org>
Date:   Mon, 13 Mar 2023 09:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230311123231.20771-1-lujianhua000@gmail.com>
 <20230311123231.20771-2-lujianhua000@gmail.com>
 <904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org> <ZAx4KqXw+an555d4@Gentoo>
Organization: Linaro Developer Services
In-Reply-To: <ZAx4KqXw+an555d4@Gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/03/2023 13:46, Jianhua Lu wrote:
> On Sat, Mar 11, 2023 at 01:38:52PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 11.03.2023 13:32, Jianhua Lu wrote:
>>> Add a driver for panels using the Novatek NT36523 display driver IC.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>> ---
>> [...]
>>
>>> +
>>> +static int nt36523_get_modes(struct drm_panel *panel,
>>> +			       struct drm_connector *connector)
>>> +{
>>> +	struct panel_info *pinfo = to_panel_info(panel);
>>> +	int i;
>>> +
>>> +	for (i = 0; i < pinfo->desc->num_modes; i++) {
>>> +		const struct drm_display_mode *m = &pinfo->desc->modes[i];
>>> +		struct drm_display_mode *mode;
>>> +
>>> +		mode = drm_mode_duplicate(connector->dev, m);
>>> +		if (!mode) {
>>> +			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
>>> +				m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
>>> +			return -ENOMEM;
>>> +		}
>>> +
>>> +		mode->type = DRM_MODE_TYPE_DRIVER;
>>> +		if (pinfo->desc->num_modes == 1)
>>> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
>> That's not quite correct, as that means "if you have more than one
>> defined panel mode (say 60Hz and 120 Hz), there will be no preferred one".
> This piece of code I see in the other panels, so I'm not sure if it is
> correct. Should
> if (pinfo->desc->num_modes > 1)
> 			mode->type |= DRM_MODE_TYPE_PREFERRED;
> is correct?

I think only a single mode with DRM_MODE_TYPE_PREFERRED is preferred,
so:
if (i == 0)
	mode->type |= DRM_MODE_TYPE_PREFERRED;		

would be the right thing to do.


Neil
>>
>> Konrad
>>>

