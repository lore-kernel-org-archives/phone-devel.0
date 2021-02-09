Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DBC433DB
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 10:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E14D64E27
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 10:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhBIK4F (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 Feb 2021 05:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbhBIKyC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 Feb 2021 05:54:02 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2C2C06178C
        for <phone-devel@vger.kernel.org>; Tue,  9 Feb 2021 02:53:20 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id n6so8209615wrv.8
        for <phone-devel@vger.kernel.org>; Tue, 09 Feb 2021 02:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3tgfIWWSNsMJyV0k5Lpc0gdOlm8W65FCoKDdWIZ0Y2s=;
        b=PvkiBWedmJOGy6M63JOOzwOhvsrhB9pf/ZukrYKMSSNsa5v0FhhTB1LIK8ktSjizY0
         /9c5ib95omWBpUlzChqr/UVK+wlgt9E9LvTx6bAi/W54fhKenc3Nxaz8VP3Ea2nMKJ4/
         bntGoP7eGJmo2Jw0I339fOQjCPOUc8TYA2tvSKsShOM58wjRb6YWVKqSN4beU6pO6q5h
         BejnMg60fKoEfHtxFN4yZqmr4/PtWO+A9vHYxIZOFbjysfYynX4oaPYwSpl9THoXiJE6
         xpsEd+IcQLkmH9ZorD9pgYObAa5f7QSLyQdUZAl2ARxjQEpWC0Ydo8Vb/LGbbBfUbNzG
         QvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3tgfIWWSNsMJyV0k5Lpc0gdOlm8W65FCoKDdWIZ0Y2s=;
        b=iFbsrYcJht1zTtPvGH2aMAixjLAaxfZZjTXGUbMjTsusaFWiQi32ZA/ZN4d6BrlLbA
         lVTH9jFqekHdm06uh9zRR9YqzyTh3peSK7kMQYm0YExdj6Y9VRyV2y4kucqjMXhqL+u3
         aM/43UPTBCKVBFI0Fe9EPPyCkrHyCAXxpUH4lid24LcNyV60dKlJ5C84SKD7xNbHw53u
         a9acAzd0o/wK1OLYMMbEEG6oEd7GdbNR5M4MhpQoLV+KSoPoWYbWtQgTcMs54i8NCbb0
         vtuK0KS8nbawAaXdAA2vNZz6Fj+ECJGEclngzjd9bSAq71lrKR2K35JL1aJ8XxdnM5Zs
         Vxcg==
X-Gm-Message-State: AOAM532MVhOvofQhcEKvrw/Fi4ff+AvFHS2Ocd75QQp9gKqyoi60wSvv
        GW5uYBGfyNEqLYOVVMm7hHCNfA==
X-Google-Smtp-Source: ABdhPJw1mC6tVz3m3/HGZ9D9MhWlOJ16dhgADK3EpUH00Wj+E9WTLBicbYjMVzYlj2rgMNXgGwZj2Q==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr24248657wrz.86.1612867999336;
        Tue, 09 Feb 2021 02:53:19 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z63sm4147635wme.8.2021.02.09.02.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 02:53:18 -0800 (PST)
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add SDM660 interconnect
 provider driver
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, marijns95@gmail.com,
        martin.botka1@gmail.com, MSM <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201017133718.31327-1-kholk11@gmail.com>
 <20201017133718.31327-3-kholk11@gmail.com>
 <24ad51dd-ff54-35af-a7bc-92d8cfa30c48@linaro.org>
 <CAK7fi1ZC8F57WmDg57tAS=b++ewjPcMhBXmeuM7Cjqkp-5Zu9Q@mail.gmail.com>
 <55f89461-607a-8864-ff31-77d16448128c@somainline.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <d25e4301-a2b5-e212-9c88-a4c66936f4ee@linaro.org>
Date:   Tue, 9 Feb 2021 12:53:17 +0200
MIME-Version: 1.0
In-Reply-To: <55f89461-607a-8864-ff31-77d16448128c@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 9.02.21 0:09, Konrad Dybcio wrote:
> MMCC got merged via the clk-next tree, so.. since this driver was
> technically in, say for the dt-bindings conflict.. can we get it
> merged again? :)

Thanks for the update! I'll take it for v5.13.

Cheers,
Georgi
