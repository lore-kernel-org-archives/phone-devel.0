Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05C3C43334
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 12:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240384AbiFIMMG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 08:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243430AbiFIMMD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 08:12:03 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A786332EE0
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 05:12:02 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id n28so30926352edb.9
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=35+OxtjxgC3eYwAbp4/2PDr0i9pDlp26elktRUGxVwc=;
        b=MzGcAx8cOg3qkErF9kdH7BugrP0alKEVzRHjKFl7onbm5VHBVIRioqj7Ufvce4vD+E
         OQQCZgAhLi4bo36II65Qz47HKCnrI0MfnwCoaSLUlQoU76vq7wt9uEFEX6A0w0nlEV1C
         GraysaFA1hBG0BFBEdfYBwKOreUyt639KhT1WtFwDijJN50hGSIi8cKl2x0PsFKQ6gVu
         uVC9GlmOl8qRmnhNU7lanJSfg2e8D2ZXZ2O1sqPjyA5z9C/mYEHzN6oeVo2WqtCvGmp7
         odEkop7niyv5iHdq61CLOypONyAYgONToGUqoYtdXqgUNuX0A8VbmjwMnj2IeTMg9jTg
         MS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=35+OxtjxgC3eYwAbp4/2PDr0i9pDlp26elktRUGxVwc=;
        b=qwAlLm7J5Zg9R+3Mww/QZPv3VQxnnFGmtIqBDbsMQQKCDQUdC5/y7iQd1gmn5vAgY4
         BsFpl1FsE64/0OS4b/Uan19IYJf6zvnCJ3VF2YcbFSVYZlR3TBGOCpO0ruD96rhDiLge
         dfAqchMBJsYgsgBBQ0DPKBizJNoymR+xViiQMT68k1H8eGz4YkG/WY5oGapxrGpbonEX
         CdOdz+MLkZuejPkw2j9ErjWx0UUaltgONg0GOtuMghTqOKS4Ev00uG33L+MK1wb9Heuy
         sSfmW+gnGOMr/aMTtFTaI72YHQhOFdW4/8zagewtJ/7NrL+NzUtqMzQ8ia184GKVXrft
         kJSQ==
X-Gm-Message-State: AOAM531/31SvaqUKLpW+UFnOj72/PkwooOA/biQGm4L0RHrQgjBkc/1U
        622u3pcqMYwG4klTUWMglUr/Cw==
X-Google-Smtp-Source: ABdhPJz0+DDVc2ZrkaX5S9IetfY47zQT7j8sKaKAcXh2Dm/QqxGZ8Bbf9nUDCVbDzQnntW97yJMLQQ==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr44688465edx.128.1654776721243;
        Thu, 09 Jun 2022 05:12:01 -0700 (PDT)
Received: from [192.168.0.197] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906494800b0070c4abe4706sm9006250ejt.158.2022.06.09.05.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 05:12:00 -0700 (PDT)
Message-ID: <fd3ae279-eb0e-ec5b-2611-15ada34a9c66@linaro.org>
Date:   Thu, 9 Jun 2022 14:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arch: arm64: qcom: sdm845-shift-axolotl: fix
 Bluetooth firmware loading
Content-Language: en-US
To:     Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>
References: <20220609095412.211060-1-amartinz@shiftphones.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609095412.211060-1-amartinz@shiftphones.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/06/2022 11:54, Alexander Martinz wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> Add hsuart0 alias, firmware name and prevent garbage data on Bluetooth UART lines
> on the SHIFT 6mq based on the Qualcomm SDM845 chip.
> I discovered that these were missing by comparing the DTS with similar
> devices such as the Oneplus 6/6T and Dragonboard 845c.
> 
> Signed-of-by: Dylan Van Assche <me@dylanvanassche.be>
> Tested-by: Alexander Martinz <amartinz@shiftphones.co>

Thanks for the patch. Instead of your Tested-by (or beside) your SoB is
needed, following Dylan's.

Best regards,
Krzysztof
