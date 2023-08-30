Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295BBC83F1E
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243343AbjH3Sry (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245158AbjH3OgH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 10:36:07 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9D7193
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:36:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99df431d4bfso746993466b.1
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693406159; x=1694010959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z1Z9G4G/KVFZhr9R3sGbutXUCNsEgKocPQNRqGJxWY=;
        b=SxXAjuozRbHVyZx4LSCM/YmDT2itM7Gi5HrPu9MnmKRudaCJxIRBJWUET+VzQb4ZP1
         ye+UFQdd55CSL/AMgebhssiqGvmaMHTFwm3yqvEZLWUcyvwtT38xuJ3WcEnvwfykTw6E
         4m61Gbaydv9m9Yt3Y81+LMBvgWZ3S+DKTLHqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693406159; x=1694010959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z1Z9G4G/KVFZhr9R3sGbutXUCNsEgKocPQNRqGJxWY=;
        b=exw2yFsjCzIuXNml4mZ2WFAgCmOaPdJFmZLedT8NuJy8A23YmQx2MsFX7l2jQNdRrv
         PgmQ5B237xsm3bpI23tdgU3jo+hCZIVewyt59BiVDF2Q9b3hUIHt6d2VLHEf4tr+taPw
         GHZDYeYy5dmB3H5oBibm78VjDIpugb30YgoxsJb3pCW0OSaYakwpl+OqGxMFKDtEIwch
         xI0Z1RDSloizCb41vpttN3ycbe6eXpnT8drVLSH1eQZ6jqOHJGuX13Im6156tHKFy9TS
         OYvncNmbuRsZDEM8qYLqUc/kTg6fpMlYr5PrVxFJEb/3HTT3FXE4niMqNTILv+vA0BNr
         ZNog==
X-Gm-Message-State: AOJu0YwtTvwkYAaaODNZ3OiHC5/olhTr+nRbC5Maa0CcybFgR4lAYnR1
        CUZVpevDJi2zBy/lA5ItuwGpcZv0Ai6EziDQDqq++fKf
X-Google-Smtp-Source: AGHT+IEkC84m0PBH3rNTgtLvl4I4x28zEzDjKnX9Pnbf/FgmEklmmNpLRRwqN93SoJeSuT82st3ZXQ==
X-Received: by 2002:a17:907:2724:b0:9a5:a068:5548 with SMTP id d4-20020a170907272400b009a5a0685548mr1604282ejl.75.1693406158965;
        Wed, 30 Aug 2023 07:35:58 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id gy25-20020a170906f25900b0098951bb4dc3sm7266109ejb.184.2023.08.30.07.35.58
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:35:58 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-529fa243739so15274a12.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:35:58 -0700 (PDT)
X-Received: by 2002:a05:600c:4f93:b0:3f4:fb7:48d4 with SMTP id
 n19-20020a05600c4f9300b003f40fb748d4mr325936wmq.3.1693405853267; Wed, 30 Aug
 2023 07:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com> <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Aug 2023 07:30:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
Message-ID: <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
Subject: Re: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
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

On Wed, Aug 30, 2023 at 2:58=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On some platforms like sc7280 on non-ChromeOS devices the core clock
> cannot be touched by Linux so we cannot provide it. Mark it as optional
> as accessing qfprom works without it.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/nvmem/qfprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Are you actually testing burning fuses from the OS, or are you just
using the nvmem in "read-only" mode? From comments in the bindings, if
you're trying to burn the fuses then the clock is required. If things
are in read-only mode then the clock isn't required.

When I compare to the driver, it seems like the driver assumes that if
more than one memory region is provided then you must be supporting
burning fuses. The bindings agree that having 4 memory regions
specified means that the nvmem supports burning and 1 memory region
specified means read-only. The extra 3 memory regions in the nvmem are
all about fuse burning, I believe.

So maybe the right fix here is to just change your dts to specify one
memory region?

-Doug
