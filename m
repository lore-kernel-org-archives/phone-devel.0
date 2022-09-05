Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F78EECAAD5
	for <phone-devel@archiver.kernel.org>; Mon,  5 Sep 2022 10:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbiIEKZ1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Sep 2022 06:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235786AbiIEKZ0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Sep 2022 06:25:26 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB061D30B
        for <phone-devel@vger.kernel.org>; Mon,  5 Sep 2022 03:25:24 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fc24so7122309ejc.3
        for <phone-devel@vger.kernel.org>; Mon, 05 Sep 2022 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tjdYvR8E0+l6GeD8FDNuLO2kjFcNArxBvfUsfzvYnYs=;
        b=ThskbItrDltJOw8UaJnG/e0zsBPZ3pMF3oa1A4HicHWldUutTQYktKhjlp6FN40sfV
         RTDfM5WhgFxVCrHAfjYZ8vWxMdUNCLy79lHI2/EZqNPxANkdw/EWHg1cYTjwq8YG7dNG
         vL+8UpWsh1Vm73wZ+eDL1i9ge91Qc+NSmDMSOH3haCsOqc2JuCdy+CYuutCjDrnzQDr5
         +YcVD02+aY4lvTQhL86uwIcW6enczWvRQqjOiiRs3LPpvT9GEFR7+6wbAfoF5WocHS3w
         Le2zZQVx+m6gzE+nLl98F2jL/fnIWaBDM1NaG8NacQvq5x2WzHGm7p5QYGmvFLRS/hFy
         Dqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tjdYvR8E0+l6GeD8FDNuLO2kjFcNArxBvfUsfzvYnYs=;
        b=ffHKrc6FTxq+aQTeGYrG5wS1/McfdHus5nCFwnGifJoe7qN+YIuga7RoEJbC2bpUKK
         h2GvovF9r1p/drPC0xqJ/5CfN+6ITthozf31jWYuRhP4ABoAd1VyoH6/t/5RPn8qR0c7
         ddOzrklTLW7YUrp4rOjLBymwUi9OWyxIkN8T+cCB04dzqwdETl8WpL6D3ImjBUBbDPuo
         ciibR85iph5Ul7z0WdAoiWz+wX4otaPIQ5ZZavZlA3rXexV9GYGOQniO9G6huLM894Yq
         LYXVr+4UI0VHSPpcleT5tpC/gUKXYGF4ZuUKLg9gOUTFHhEYBPIeEk9Z+xyXEI5KLjG7
         e7bg==
X-Gm-Message-State: ACgBeo2LVHyzN+a1LQouN+A/Xv29UqpcyqsbE4Zu9LeVHmuOLnfNIX8r
        86hIHZBhx9vUoR7U61TN/ILZrZgs+rXbZZcLV8LvFQ==
X-Google-Smtp-Source: AA6agR6hfZQ/uvkWavri/AyJyzuTNgfUoo3sMwrkJOJhFgiuZ+BqVOBOzgqyEIaF7YGc8n5iiBtNNiHvvfvw3qVQBaA=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr4945891ejc.526.1662373523139; Mon, 05
 Sep 2022 03:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220904214935.31032-1-jahau.ref@rocketmail.com> <20220904214935.31032-1-jahau@rocketmail.com>
In-Reply-To: <20220904214935.31032-1-jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 12:25:11 +0200
Message-ID: <CACRpkdZDS=goO+-oG+PQ7SvTndiyUyW0YFxCfE3T=QYnQAmSqQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add magnetometer
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Sep 4, 2022 at 11:51 PM Jakob Hauser <jahau@rocketmail.com> wrote:

> Add magnetometer Yamaha YAS537 to the DeviceTree of samsung-serranove.
>
> The YAS537 variant was recently added to the Yamaha YAS magnetometers
> driver [1].
>
> In the DeviceTree of samsung-serranove for the Android kernel, there is
> unfortunately no information on interrupts or pinctrl [2].
>
> In the Android kernel driver for magnetometer Yamaha YAS537, there is a
> device-specific matrix to correct an ellipsoid shape of the measure values
> into a sphere shape [3]. This could be converted and applied to a mount-matrix.
> However, the current state of the mainline Yamaha YAS537 driver needs
> post-process calibration in userspace anyway, as it lacks a formula to center
> the measure values around zero. The correction of the ellipsoid into a sphere
> can be done in the post-process calibration as well.
>
> A mount-matrix is needed nonetheless. When putting samsung-serranove flat on
> a table in portrait orientation heading north, the Yamaha YAS537 magnetometer
> axes natively point X+ to north, Y+ to east and Z+ into the ground, which
> corresponds to a common way to define the Earth's magnetic field coordinate
> system [4]. According to the IIO definition, it should be Y+ to north, X+ to
> east and Z+ upwards [5], which corresponds to a common device coordinate system
> and eases sensor fusing.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/iio/magnetometer/yamaha-yas530.c?id=65f79b501030678393eae0ae03d60a8151fbef55
> [2] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/arch/arm/boot/dts/samsung/msm8916/msm8916-sec-serranovelte-eur-r03.dtsi#L318-L321
> [3] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas537.c#L105-L106
> [4] https://en.wikipedia.org/wiki/Earth%27s_magnetic_field#Characteristics
> [5] https://github.com/torvalds/linux/blob/v5.19/Documentation/devicetree/bindings/iio/mount-matrix.txt#L93-L126
>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
