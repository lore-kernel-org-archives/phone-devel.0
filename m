Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7D8C27C76
	for <phone-devel@archiver.kernel.org>; Wed, 25 Jan 2023 11:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235721AbjAYLhT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235554AbjAYLhA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 06:37:00 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D89817CC0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 03:36:30 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1018653wma.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 03:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dVhlUNjqsBL30qFj7Fwhndj9IVP6//dpSPYEVekBIY=;
        b=Kfhm/onlZx2XNp3mdcPwUJXKM/RQ9cXvyvfCBFaza36IV80QSJlRXc6u8VFbj0YDCU
         5CaxDqL7o8JrgR9Qe7ocBOkJ1eLv8Rfx0irZCdhwepiMbfh1btuRiajQ36SlDAArAOqz
         3x4Lc1aLNYGJt9UalXa7G6rtWEBbCqkFmkSXOaizotUJndK5Ce9a/bhRZufzro8qCkhv
         y7ZU3RdNDDxWg56tKp5MQq+03MBS6vjUL6eHmqjnbo+AfYS24K/7Q19Xce31qkKfZJMw
         bo6TPMS/Q3BoZqAC4Td+Nm0J79kLe5u/5a4ziZDNgJCAP6u8ho6T4cgYO4GCZ9I8STeD
         F50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dVhlUNjqsBL30qFj7Fwhndj9IVP6//dpSPYEVekBIY=;
        b=hSc7mDBKIrMIVP5kPddUuG9sEBaRoD7RTKmFIpRlnfsDG3W8y5aQTMghhomLsq9f4o
         lzeUI2p+PHgxJNjoK5JJWBrbz4PqngcGKcJENt2xECGgzmrqoZShy2r9oW3nRJ8muYEK
         YQmaiaCxGxlQJIuFl75Md2XXQfXIf9N/90bL1irXUpo9aOx8qUXhZ92AWXRpQfhrOTwc
         fp5eWX+1E3EEeeFu2kWj4LsbFRrH6hs7eAPRO4d/1UX82urFDuBwQdZFNfiJpxeH8Ik8
         7vo0/x3PH5mO8Cl0DcC5S/z2K39jfupkneJYm4yR40nTUybnHR+FywO5qLagVYImSi9y
         jk/g==
X-Gm-Message-State: AFqh2krCP0RNjRPRPpzf9IY2R/LAAQkIfxrBXz+O1AyMfpGhSYFn7OeD
        kSovCat85QMND2SzcVED9E/MMw==
X-Google-Smtp-Source: AMrXdXsIWEY9FTI1OV1UwP/0HQPv4v1+dM8bovEcXISKZKpdILaC0A7PO/9NZBTVAPpZTTdVsdtfqw==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd2d with SMTP id i22-20020a05600c355600b003db331bbd2dmr20147637wmq.18.1674646577387;
        Wed, 25 Jan 2023 03:36:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b003db2b81660esm1642996wmr.21.2023.01.25.03.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:36:17 -0800 (PST)
Message-ID: <a768138f-a960-16b4-7097-9212638141a5@linaro.org>
Date:   Wed, 25 Jan 2023 12:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Pad 5 Pro
 (xiaomi-elish)
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230125112903.10710-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125112903.10710-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/01/2023 12:29, Jianhua Lu wrote:
> Add a compatible for Xiaomi Mi Pad 5 Pro.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

