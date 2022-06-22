Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2CDCCA482
	for <phone-devel@archiver.kernel.org>; Wed, 22 Jun 2022 14:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358650AbiFVOfK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Jun 2022 10:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358653AbiFVOfJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Jun 2022 10:35:09 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596223A5F0
        for <phone-devel@vger.kernel.org>; Wed, 22 Jun 2022 07:35:07 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id t5so2182259eje.1
        for <phone-devel@vger.kernel.org>; Wed, 22 Jun 2022 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=H/cSfccrkMobuaWdmE/tdPoYRx0z9bpXg+/yToTVvnE=;
        b=EzNqat5NrSDe5C45j1gKPwkoY+xrhidH+Z3Io7mhsMwqTNnLBUaUqxRvEbatmHXAh8
         9R3VSv/sxc9Cka2XRU3PM+c1zHm/1nOsEmLooSA985j/kn3qrN4Nf6Y+KCn7AVfqwa8U
         oSUoxFP+uHkVZUNXblWZtsOPHxfd38C05M1J/W3+8xDSZanH8hUTP0xNCuvjt4qajvsK
         WPTsGa3qrNsJbMB7JVilnqYU99IMZ6Zz7HQH1j3Wi0gpZ3ZlD60gHK7iPQlvJOjq6Ljy
         yu1XE4KI2cVXyfy3y3xwGNHO7gy8kNWuEH3fveAZ6avUzs+XnGMyg2aRzXbypXDfewmG
         uc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H/cSfccrkMobuaWdmE/tdPoYRx0z9bpXg+/yToTVvnE=;
        b=TyF1FbQg+2TkFmVZNn78mW00APrSPe2DfHFemYeN+cwrXd/y7c3SN3au76SStGNXzN
         UTF4jZ2KLzXySt0lmMJmgsgtrjleDloJmtLy0ZdBpaOXk54+pZ+R8OYf+9n/Fd3oysGT
         bFi9ALIBLwRk9MwMDZEFMP9Fc2ifWaLQdzD4v1kZuItyUZWfRfTgQhShQ07GW14LwDD4
         sF2T+cYXLx+owAU+UkxVpm8CzTlBqXmjmbVhlwcc97YtmMnvPwmE3qMOr8jD0bqxtFdB
         qNv04//z2FrLjje87oqqGpSGNa9+kSauAxmMB3G9hcZPoE4QHiXmCevkLHUHUQsuem6t
         +h6A==
X-Gm-Message-State: AJIora/lg+3SE8A9K9EjXpYJMzfIUgtMZcfycUePo4w8i4goeM6LUa+l
        Ss/6Vb0goaSASVa4soYEle5lcA==
X-Google-Smtp-Source: AGRyM1vJVzIPqFGBsUHqfmMJi7WDemTnx1NnVJOZoZ49hmcATWo1tUFMa4ra8zQAsOYs2fyIGY6jyA==
X-Received: by 2002:a17:907:7b8d:b0:722:dcae:6417 with SMTP id ne13-20020a1709077b8d00b00722dcae6417mr3366157ejc.225.1655908505951;
        Wed, 22 Jun 2022 07:35:05 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g36-20020a056402322400b004357f88fcdcsm8144577eda.11.2022.06.22.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:35:05 -0700 (PDT)
Message-ID: <5421df1e-6e86-27a4-3da7-c15661aee190@linaro.org>
Date:   Wed, 22 Jun 2022 16:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
 <20220622064758.40543-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622064758.40543-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/06/2022 08:47, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the DAIs available in WCD9335 to avoid
> having to use unclear number indices in device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                              |  1 +
>  include/dt-bindings/sound/qcom,wcd9335.h | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b774f21828f7..2bcc3cc129c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16366,6 +16366,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  M:	Banajit Goswami <bgoswami@quicinc.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
> +F:	include/dt-bindings/sound/qcom,wcd9335.h
>  F:	sound/soc/codecs/lpass-va-macro.c
>  F:	sound/soc/codecs/lpass-wsa-macro.*
>  F:	sound/soc/codecs/msm8916-wcd-analog.c
> diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
> new file mode 100644
> index 000000000000..709d33ca748d
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,wcd9335.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef __DT_QCOM_WCD9335_H
> +#define __DT_QCOM_WCD9335_H

Header guard should match better path, so:

__DT_SOUND_QCOM_WCD9335_H

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
