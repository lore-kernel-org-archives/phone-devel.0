Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6BCDB482
	for <phone-devel@archiver.kernel.org>; Tue, 17 Oct 2023 16:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbjJQQGd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 17 Oct 2023 12:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343611AbjJQQG3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 17 Oct 2023 12:06:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7DBF9
        for <phone-devel@vger.kernel.org>; Tue, 17 Oct 2023 09:06:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a55302e0so3803837e87.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Oct 2023 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697558784; x=1698163584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xvYIvKO+3mIU3EAawcs2ywj4vAenzsPefTCCzUDayw=;
        b=pQnEVIr0Xlan6GcNIOcP1aBX2wZxu2MaS4pBcb0hT2EmSlTCsbEtj7PnDDJi+gqbaj
         jR1R8D3j6eczOG2ps5A4M2V5oPE4Zxw+TztolhBNwsUThOeD7ujq8G2bqEHTm0evIa88
         IXzsAvD6et/w+twWTVa4WAZWKN5L5cgaHqZVWCMeLweKhrWBrAqtQjkG07etlGJ2yAOa
         HjcRzXfv6FKf2lneHtcqLWkBH/odjsQx6uyvfvZzQ18JSUdcScGevWPCXZQxedT9SgbY
         Qzm1muaiVgy7/3GP0sf2dqA2RZKxGFI6O6yY5sixfGVCw6dm3fl/qiqfL55uPzlotSQ9
         NNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697558784; x=1698163584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xvYIvKO+3mIU3EAawcs2ywj4vAenzsPefTCCzUDayw=;
        b=KTfqvBJjcontrrBK9hziXMQCYenWL6OfG/b4BF7kDXGLN2j0ziB/NMtUKS7InMrItr
         fTsA3W60j1uKHo8QQb/6mTqle/771E4nBDi0KszGrhOcpUanl2TKOP7zuWwof5FgNrGH
         4V+0F8jdOftNmZetKey67B7A6xtfRluNBG+Bg+slWbePD+bGgaMQ14EF0N/Kz5V0al8Z
         Q9sC/4YipvNiN7zibj05/alu+c864goyhIaVjWWZaBOj5FKaFBibqs1/6tarTkODuISV
         QFJk9yLGHa+NsJdwWlw+knmj0td7NVIEXDeg6RENwkXsjcIoGP9Wt8tCgAn8SnHGkSO6
         +m+w==
X-Gm-Message-State: AOJu0YybkG+ouZQ6nTa8qRwx37zfP+jSQwEFvpwmZl7IF2QmPBVTobjc
        Cv47lrjig4x0idyGIK1A1gGkVA==
X-Google-Smtp-Source: AGHT+IHhQNyrTYgGeequm9qL3R/xX0Qa+zpfneS2Tc5Nq7DmGCHtImf+Fy/36eKebqA5lYzx+mCbPQ==
X-Received: by 2002:a05:6512:3ba4:b0:503:221:6b1a with SMTP id g36-20020a0565123ba400b0050302216b1amr2485376lfv.0.1697558783795;
        Tue, 17 Oct 2023 09:06:23 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2443a000000b005030c533843sm329505lfl.154.2023.10.17.09.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:06:23 -0700 (PDT)
Message-ID: <dfa1699b-271e-42b8-a8f3-17baef37f417@linaro.org>
Date:   Tue, 17 Oct 2023 18:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8350-lemonade(p): new devices
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Nia Espera <nespera@igalia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob <Me@orbit.sh>, Clayton Craft <clayton@igalia.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231016-nia-sm8350-for-upstream-v1-0-bb557a0af2e9@igalia.com>
 <20231016-nia-sm8350-for-upstream-v1-5-bb557a0af2e9@igalia.com>
 <CW9WUOLK18R1.2HI2MM4P47HPV@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CW9WUOLK18R1.2HI2MM4P47HPV@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/16/23 15:50, Luca Weiss wrote:

[...]

> You never plugged the device into a USB 3.0 port? Should be trivial to
> test I think?

The biggest blocker is usually the lack of an actual USB3 type-C cable :P

Konrad
