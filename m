Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12071E92710
	for <phone-devel@archiver.kernel.org>; Thu,  5 Oct 2023 14:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239322AbjJEOrH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240210AbjJEOo7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 5 Oct 2023 10:44:59 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D6D16AEE
        for <phone-devel@vger.kernel.org>; Thu,  5 Oct 2023 07:21:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50435a9f800so1367089e87.2
        for <phone-devel@vger.kernel.org>; Thu, 05 Oct 2023 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1696515667; x=1697120467; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=onRU8Y/jXDlaGXA+m6kH7bamAm9GIlcBQ1TGe+vGhSQ=;
        b=Xa2ycxitRJmkmyEPwvy1Ky5DIfNkkHFzikrjB2wJ7CqXvvmT/Z/MZnGcGgTZdCInRN
         oCGvz1UKgsRIj0lG7hAHF/IMkLubyfCiAh/yAQvfhWMKUuZLdGrJD/NaYtH60jysuVC7
         1KbxrebVK+c+x9p16HQqKvB9ZtH7P5n04xkqYT1yHm7zZy1n1Ud6NAedTuvwLRdCOgwh
         cy/32XlHQcX9/BvG/N9Ta7YSVBt6/Yr2x4/dftCaW9Ayzi7oqFO3rslV4f3seZj7h/6N
         TlXK/hNyM499cTblUyi1QaiCDX4fKJQ7zVfYDtAVEz/BgTj4ohw6aexdfPeRAjMMgxS2
         6bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696515667; x=1697120467;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onRU8Y/jXDlaGXA+m6kH7bamAm9GIlcBQ1TGe+vGhSQ=;
        b=WuZpJOC6JJvNWOTcNWjUp4LAlI7LuOxKHwF/fM7vL0m15aGAQ3VS8pwe8C2isqdUmX
         Ax7khUu0a7p4FgNiRflm8uf3AOqJ2xf0RIvTdvkP8wlm3xKorg/vHKZXQwQ1wcxYiDd0
         RDJYmcr8PiHbUtuowqgfwSg2jiRFQJ1ABApzbJfT7YklZtFkvhCeJM71jzjJIngAE35R
         8FX1FEHmqAK3HyE3SC6GHzXk08LTgS0qnC9FPq9Zx21dfMxzW3p86UQj8vjo5zuJZ1+Q
         Z6EBodeiFaiYroF2LEVWgBmHTzT2rpPSb0XFnAahdiJIS8y5BqYewQQK5EmoKJEWtls8
         lNrg==
X-Gm-Message-State: AOJu0Yxtu7Pd0IJTX4+vpIzcNZA8M05MmKce7QCGg31JPRl3t8/Xepoz
        SM4TNjhW7bSrgpCQ5lfdV7/6yA==
X-Google-Smtp-Source: AGHT+IH4VhF219dRGP70eZMjQoWP5soQazPniTQw0zoui1ncQEviX4+FQu6riCbAWM7259/4rJ7fLg==
X-Received: by 2002:a05:6512:210c:b0:4fb:bef0:948e with SMTP id q12-20020a056512210c00b004fbbef0948emr4039144lfr.5.1696515667464;
        Thu, 05 Oct 2023 07:21:07 -0700 (PDT)
Received: from [192.168.2.171] ([94.186.212.25])
        by smtp.gmail.com with ESMTPSA id y22-20020aa78056000000b00692b6fe1c7asm1457287pfm.179.2023.10.05.07.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:21:06 -0700 (PDT)
Message-ID: <284103cfa6bc312ccf12a552dd61d12108fabfbd.camel@aceart.de>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
From:   lukas walter <lukas.walter@aceart.de>
To:     konrad.dybcio@linaro.org
Cc:     agross@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lukas.walter@aceart.de, phone-devel@vger.kernel.org,
        raymondhackley@protonmail.com, robh+dt@kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 05 Oct 2023 16:20:57 +0200
In-Reply-To: <8e6a41b2-7ad9-4cc6-8f95-93b8c2e4151f@linaro.org>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

>> Is this fine?
>> Should I send a V2 with the signoff and reserved-memory changes?
>I don't quite get it, what signoff?

Krzysztof noticed that the Signed-off-by are in the wrong order.
But I was told this alone is not worth a V2.
