Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30837CD5BC7
	for <phone-devel@archiver.kernel.org>; Tue, 19 Sep 2023 14:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbjISOU4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 10:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbjISOUz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 10:20:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E39134
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 07:20:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c93638322so1243519366b.1
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695133246; x=1695738046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/FEvYyM2EeHOdSQPD/GJAyv/Ms6P3+0S37WW9XjZPo=;
        b=TXLMGJGaFVrHBRyfllzaGhfqAsBdhVp/eTAXg60EJ70UuPe0HHSudXnyqFVeEDS8t+
         fut9X7bc8mI4LIv9dTFK1c0K9Ff8y/io+UThm1XesnITZU0CfF8uGWUTqSQm9N3EgLVu
         SQlqQQJN+P2eQ5qVbd4u+CjJqJBs6cCUtUokU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695133246; x=1695738046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/FEvYyM2EeHOdSQPD/GJAyv/Ms6P3+0S37WW9XjZPo=;
        b=BVzANQKeFz8Bwqcd0/iW8AZviZ1GVr8MdH6ENpaKHtOgLpcOTG3P+RcJ2eNr4wsv+E
         wI1/WpXuF+ge1nh+KDtNv0PNV0RPENeCRxf8VKrhNfHeSup3EgUcGqn/oXsc7OmCBztV
         uQXWHZ3sRB9374WY14JXcfAiC6GFekCs+uC0EshbD6G1i135mMVEPZ6Wh2JwO/YqREyD
         LBOhK/4Bjnh38oG+f7qvjlSoseWaH+TxBG24oj7OIgW0XA/r2oFJeLtFI7E1kuYUMjpD
         5/kQ6gWVWkBpEz2M5uJ82aV6e79CmMOLJ0O2mPWi8N/pogy/liIjMDhuzkKzToIstNTK
         Hc4Q==
X-Gm-Message-State: AOJu0Ywr5vPzvIC4184nwwmaeyy9bqOqQRXoa3SCInN+uZwnk+xb7Ycu
        vNtY8tMQZBimbkkWM+O94gqeUXx5EgR+M6vtjkyniGxs
X-Google-Smtp-Source: AGHT+IFdQ/spHP1uP23cA6+5uXb2C6Dp3ixN7XQd6Q3wrBIg+1KSMo3E0H5fypCAdJ+41SRDZqNQ2Q==
X-Received: by 2002:a17:907:9711:b0:9a1:c35b:9e09 with SMTP id jg17-20020a170907971100b009a1c35b9e09mr4113964ejc.8.1695133246179;
        Tue, 19 Sep 2023 07:20:46 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00991e2b5a27dsm7733492ejj.37.2023.09.19.07.20.46
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 07:20:46 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so14947a12.0
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 07:20:46 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0b:b0:3fe:f32f:c57f with SMTP id
 bh11-20020a05600c3d0b00b003fef32fc57fmr110023wmb.0.1695132919977; Tue, 19 Sep
 2023 07:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com> <20230919-fp5-initial-v2-2-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-2-14bb7cedadf5@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Sep 2023 07:15:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmW8QwcT=YN8VSffuds2ib5zYPr6O2oQ=kUJkKa=5Bmw@mail.gmail.com>
Message-ID: <CAD=FV=UmW8QwcT=YN8VSffuds2ib5zYPr6O2oQ=kUJkKa=5Bmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] nvmem: qfprom: Mark core clk as optional
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Tue, Sep 19, 2023 at 5:46=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On some platforms like sc7280 on non-ChromeOS devices the core clock
> cannot be touched by Linux so we cannot provide it. Mark it as optional
> as accessing qfprom for reading works without it but we still prohibit
> writing if we cannot provide the clock.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/nvmem/qfprom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
