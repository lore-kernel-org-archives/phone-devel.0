Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8BBC05027
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 10:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbjAZKAP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjAZKAO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 05:00:14 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B5D1E5E3
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 02:00:13 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id fl24so763917wmb.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 02:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRgVXPw5t6QVo2geW3WNhb1rgDC2iA39PRv/GAVQDio=;
        b=vTcMGyXsf39j1Pv1ktHj9xKL5iJq2HfVCB7ZDr/oA7PxzZWC46OtUb07mNAD5yZMBO
         p9nPr3PZWB5lLNVS8lpvd2ZQVWNh+1zlHNlyByHZmrUIawF9kgeiP+xG7IzbRNDfUT/U
         U5Amgws9CsWnwBI7AoThUbiVUETnMsJ8ohSjOHmT0yqvv06GEYytAk00/wIMElspB0UT
         t0MzSBWCHGNE9Hpgx1H6tJyNRGPTNOSHHf1ObB2SZUx9QcQYbFbVoK0LfbSJHwpzviUf
         d0SjDF8XGuaKcgz66eQrykR9AALBDeCquTKiYuvUoDMKJeGJliInGycAIpQzTMVaLt9R
         s/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRgVXPw5t6QVo2geW3WNhb1rgDC2iA39PRv/GAVQDio=;
        b=XN+g9IryYF9RzhyOH/edzWXhSOodcivu20LSFwX4mdIEQeVPqtEawtT3Shu8PNKIuG
         sKbh+glDdCP5P5JywoQqfgMCNsd/zesZcWp5nHHK5C91rXsCC1QDX+Nf+cnApdgs5/Ch
         KrtG1F8DjGGBnsDNJpJcX4r8Pla5W+63MhHyvoLk/MAo7ai0RsP0TJU1794Dixj35A7I
         YiCcBkdI+y5Y99voVIFjpvXTChH4oACVLn2LnMVi9s9dmzw3AybSPOsL1SFUsgwHjSfC
         qAJ4TndvRK2OP4Wx3uWxDuSR9SpyNSfZxh/Xu0f+okFVKtSUl8yhiZtbt09NSLVSIME9
         LS4A==
X-Gm-Message-State: AO0yUKWfyK0qz2v+VAwAECPvSBzQ+DYerUS9x9GM1/qC52VWrzZjbkiz
        lDGDyGTj+/RZsu1l+GdjkPqhmQ==
X-Google-Smtp-Source: AK7set/aZLK6a4J5BP5py17o2vPlMYEYYqGkUd/mG6BXhAEOu/N3E4T9mGZDkPE1RSRpaEXhZnwoVQ==
X-Received: by 2002:a05:600c:3512:b0:3dc:2c7c:6616 with SMTP id h18-20020a05600c351200b003dc2c7c6616mr210993wmq.21.1674727211804;
        Thu, 26 Jan 2023 02:00:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aa89:e801:e296:9b7c? ([2a01:e0a:982:cbb0:aa89:e801:e296:9b7c])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c479400b003da119d7251sm985242wmo.21.2023.01.26.02.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:00:09 -0800 (PST)
Message-ID: <6d304884-9e54-6eba-1e2e-882fa6c5b983@linaro.org>
Date:   Thu, 26 Jan 2023 11:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/3] arm64: dts: make dts use gpio-fan matrix instead
 of array
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Heidelberg <david@ixit.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        ~okias/devicetree@lists.sr.ht, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20211029114948.41841-1-david@ixit.cz>
 <20211029114948.41841-2-david@ixit.cz>
 <CAFBinCBVXNYG62jKABhJJt0m61+vQKqEyC4Mk5Ljg7htN-brTA@mail.gmail.com>
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCBVXNYG62jKABhJJt0m61+vQKqEyC4Mk5Ljg7htN-brTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi David,

On 31/10/2021 20:39, Martin Blumenstingl wrote:
> On Sun, Oct 31, 2021 at 5:51 PM David Heidelberg <david@ixit.cz> wrote:
>>
>> No functional changes.
>>
>> Adjust to comply with dt-schema requirements
>> and make possible to validate values.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 +++++----
> for meson-gxm-khadas-vim2.dts:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Would be great if you could re-spin this change but only for the meson-gxm-khadas-vim2.dts file.

Thanks
Neil
