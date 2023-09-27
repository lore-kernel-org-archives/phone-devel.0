Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4975BE810AD
	for <phone-devel@archiver.kernel.org>; Wed, 27 Sep 2023 08:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjI0Io3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjI0Io2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 27 Sep 2023 04:44:28 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50157E4
        for <phone-devel@vger.kernel.org>; Wed, 27 Sep 2023 01:44:27 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-59f57ad6126so91038087b3.3
        for <phone-devel@vger.kernel.org>; Wed, 27 Sep 2023 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804266; x=1696409066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2a9BLS4u3DgICvLzOii5evpo5Bqh/hTtSobhBQ9qFg=;
        b=LE2UcuhNgnQszwITPoxCxRb6EGj+9wZDVXj8jNtBXELIZrXK/PwPsfrVp/B0h7fmNT
         wVetQbwf5qgRyopDRzKkxfCv2NuyKEEo203fmtpxwsC/EwcNJDf7GSOd6iNPvJblTOik
         uXf6UF+I0r4KCSvj27DewIcTpQm0b9d1m2+Cic5q1Ps60XaRdPvK18a9AhzfRLsKWZ0D
         Gf0nkPHN9KB0dMPP/FocyGX/hrwZuZ8XYg7Ztk/iAoVr2qnsvJCwWDwDPJUrQDT0a6lr
         uDSvsaLB2AHAxm+XOA+h/EcgpJy0Ca/WFC5Nj2nOCKXSDWHKHyfgL0oGCrhG3vdjzVaV
         mDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804266; x=1696409066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2a9BLS4u3DgICvLzOii5evpo5Bqh/hTtSobhBQ9qFg=;
        b=pntRSLWsgRGIxcYAd5glR4Y/eXhTEEp+d49sAofmVmqWwGj3WSMYJB5hZXY32YA/sX
         t07f0deroa/1ZZSHlSfmzUbKeSu3mVAq+5gdOQGl1urkX283iq0AybM9IRZsgBsF1dXc
         /1/5WI4iacT4VsXHuZk5Py2POt506ukPnMvuZc4tAC2GzJqsedjn1wWXHm1VxCpQh5ax
         3xvRKlvfApCrqgSKLSPCIepr+7sr3udBr1D3angkulNZzHXJU/KN2Yt9XA6A+B9VGjzM
         jbWxXmr4kwNeZDVxM3Yd7zvrebtAh4KwbXVI/EZmtJnefFlskNS/S7oEl/Mp9Js15Biu
         wevg==
X-Gm-Message-State: AOJu0YymslB6M7EItcSqnQQJ6UbjsUQa7DUmB872ojGl3Kfp5uobQmV4
        VMOx86E93758RLTjdKy5dK4LuwOEcLlzlVm4oplh/A==
X-Google-Smtp-Source: AGHT+IFI3OXUIw2YZjlJU3xxbWIddHpKtE/ek2D2wzGlJ0JTneFMoPW0I+2IJDJjj40UcgXnDZmQNbomJZ1OppPYI68=
X-Received: by 2002:a81:c253:0:b0:59b:f736:4948 with SMTP id
 t19-20020a81c253000000b0059bf7364948mr1497316ywg.33.1695804266446; Wed, 27
 Sep 2023 01:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230923131432.21721-1-matti.lehtimaki@gmail.com> <20230923131432.21721-2-matti.lehtimaki@gmail.com>
In-Reply-To: <20230923131432.21721-2-matti.lehtimaki@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:44:15 +0200
Message-ID: <CACRpkdbs-k2QU9XrZj1sUE5e8QEdfQ=AWhxtvtxA9d7fkC+NOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: msm8226: Add MPM pin mappings
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Sep 23, 2023 at 3:14=E2=80=AFPM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:

> Add pin <-> wakeirq mappings to allow for waking up the AP from sleep
> through MPM-connected pins.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Both v2 patches applied!

Yours,
Linus Walleij
