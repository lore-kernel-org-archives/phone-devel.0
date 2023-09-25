Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C49CE7A81
	for <phone-devel@archiver.kernel.org>; Mon, 25 Sep 2023 14:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbjIYO2Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 25 Sep 2023 10:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbjIYO2W (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 25 Sep 2023 10:28:22 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B0A10E
        for <phone-devel@vger.kernel.org>; Mon, 25 Sep 2023 07:28:14 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3232be274a0so996289f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 25 Sep 2023 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aceart.de; s=google; t=1695652093; x=1696256893; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o3p8nJzBx02DNMJ+7EnZtFgR5MAZSx4FbGOUUlLpYxw=;
        b=d9Lkph9E3pMO4GQYRdiuYmhfuCQRo0HYu2OVHL7mzNYBTBpuRd0DftyfFmVJ5F5Wm1
         N/kcJQtI7m54vukvj6tNBZpFPCqWY8PfyxnlGREn1IYM/Lo9gkfMCHcGu5GX5GsfgOyR
         hV4g+AP56ngrIZZxshO46d+Hz1D0jtn+Qoq+alBkAafHdb18uvWcgu3kfYMdrUq12nTy
         mmJvQi1R8tdUnMtRITfbzTHmXXw7T2q6RcO1D1Wws7b1U7hijbEYS5uI00PlomE4ZMZt
         nVZBdAIbvr26Kc49OOxUd54kPMOfIp4ROU4wJ4Nx7BxKZ4gi/IkfCM+Kfc4nHuwOvigR
         mTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695652093; x=1696256893;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3p8nJzBx02DNMJ+7EnZtFgR5MAZSx4FbGOUUlLpYxw=;
        b=eYFZ+ocmjc2Kn7Ju4ROYsos1AztY4DJH1CYi1Zrcw9sOgD+aKPl9A1ZBo3iiHMLbUf
         QEWFRpGrmkd05aeocvwJes1POR9AuheMaS+RxwJbrZpjDT0AFyxjB8ct1M3ntJlCioYN
         O6vCr5ZPNJHtSocbxWSYCQeJj/xXUVQioO6XrIeLsirgAdrywI4CBSwGlO7YkUen1mqA
         k1/jqcDOYWG66huAnavFvBlYz4rF+sZLQo6APcI/fAkbw2dts3kTlRMNPJGtOjjTrDHz
         RVxAGb47VvzPFmXuvpoZWotK5zYkBWJO3b6EotSXSSBBR3bXtBZZ38yFKNOrnPjbYpxt
         Cc8w==
X-Gm-Message-State: AOJu0Yy2eSA2RWc666eFBcbC0xA7Jpnn5SbFAk/4EYo9TIc5W4Qwfp2o
        jqzRJQ3kRLHZ1duhfKjgPNVOBg==
X-Google-Smtp-Source: AGHT+IHyhLLHIMrxMT5+MjTuP9mXxsxsvs3bZXzseRBVbE5hWbY+ZOUden2sS//p4i8tzLc8BaX4jw==
X-Received: by 2002:adf:ef0b:0:b0:316:fc03:3c66 with SMTP id e11-20020adfef0b000000b00316fc033c66mr5604701wro.3.1695652093259;
        Mon, 25 Sep 2023 07:28:13 -0700 (PDT)
Received: from [192.168.2.171] ([94.186.212.25])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d6849000000b0031989784d96sm12043993wrw.76.2023.09.25.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:28:12 -0700 (PDT)
Message-ID: <9ca32137e42a22b016d8d417ee9e0dc024ef2aa9.camel@aceart.de>
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
Date:   Mon, 25 Sep 2023 16:28:12 +0200
In-Reply-To: <44a00fc6-d700-4713-34f0-36b172d8cb90@linaro.org>
Organization: aceArt GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Date: Wed, 20 Sep 2023 16:47:30 +0200

>> +
>> +	reserved-memory {
>> +		reserved@84a00000 {
>> +			reg =3D <0x0 0x84a00000 0x0 0x1600000>;
>> +			no-map;
>> +		};
>Do we know what this is for?

This seems to be some QSEE/TrustZone memory required to boot.
I would name it `qseecom_mem: qseecom@84a00000` like other phones
currently have it.

`[    1.162115] QSEECOM: qseecom_probe: secure app region
addr=3D0x84a00000 size=3D0x1900000`

>> +	};
>> +
>> +	gpio-hall-sensor {
>> +		compatible =3D "gpio-keys";
>> +
>> +		pinctrl-0 =3D <&gpio_hall_sensor_default>;
>> +		pinctrl-names =3D "default";
>> +
>> +		label =3D "GPIO Hall Effect Sensor";
>I think we can have both hall sensor and V+ under gpio-keys
>
>And then I am not sure how useful the label is for the container
>node, maybe you or somebody else can tell me whether it's used
>anywhere
>> +
>> +		event-hall-sensor {
>> +			label =3D "Hall Effect Sensor";
>> +			gpios =3D <&tlmm 69 GPIO_ACTIVE_LOW>;
>> +			linux,input-type =3D <EV_SW>;
>> +			linux,code =3D <SW_LID>;
>> +			linux,can-disable;
>Should this not be a wakeup-source btw?

I am not sure how to change this. I would like to leave this as many
other hall sensors seem to be configured identically.

Is this fine?
Should I send a V2 with the signoff and reserved-memory changes?
