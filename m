Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAD3CE7A8E
	for <phone-devel@archiver.kernel.org>; Sat, 23 Sep 2023 19:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjIWT0R (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 23 Sep 2023 15:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjIWT0Q (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 23 Sep 2023 15:26:16 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C04196
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:26:09 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59c00b5c8b2so48811847b3.1
        for <phone-devel@vger.kernel.org>; Sat, 23 Sep 2023 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695497169; x=1696101969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZizts65y01ok+ES2EUhAYAn9GXHIb4VmooXZajucCU=;
        b=uNeVk+4wrEtA25qCf/0cc+V/J0m5Bv+FMDG8kGqEEoFlimXmspGlZ471bmLaWTR6Td
         svLBkwjoQ5RijQ121IJl/hmiuNKyS+WT/T2Gwm2T/sOGLUGvnXRo3v/tlVCdffyi+8zs
         QB+TT+5b2sh6nB+K0vELCI7ByecLH9qX4fncnhD3sxMhUxl2+l1WN9A95ggUhWwsLGKu
         biMyYisQOb3tnAnGiB+x2aW3r+EqpPceYseOmI29PjY1CaPZ3O8/+HKoqB8vx17UM/uy
         lUTNlH5O3A8vua5hzsHsd0MNdDlyUan+qr+hUm6Ar+JALhPs1eztA5WOu7f8XfcLK8mD
         NqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695497169; x=1696101969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZizts65y01ok+ES2EUhAYAn9GXHIb4VmooXZajucCU=;
        b=A2tJi4Jsg/4tmx+GLKxXW/Petis6laFwdCAvTC/sVsuA586u+4Khe7rw7NiX24qa7t
         39yKIdItH7G9glOhx6MFq5jJix7m28lFhTY96RochnKn0dWEL5xl/pun3Y4oIiIXDC3O
         QXwSSCd7BZNqHCRg2cvB+bya4K3ZPoIG2ou4R3p+q0Q5JNEDwlj0TGLFCATPywKsYmQw
         8Aom1esk7od8Qa1WIuBreA4nMtQ7t+Ks6XNBkJ34MNR6nYJyFQ9rlAAneKIc6MbMwFMw
         +/6wY00+krLFr0g9mf/gcnJ3OvBgK8aHlr1ya9sTL4nNUa3vhW20+GnpDZnwc8Cr3MZ0
         s7vQ==
X-Gm-Message-State: AOJu0YwU4KVm8oFTB/rdoq/VAxtECv3lsC/qI90TmqgrCAD3W6SwRwXs
        p2oM+TufrKqPnic+YRJGlXtemgol0Igu+WxaWeu+yA==
X-Google-Smtp-Source: AGHT+IH8xd9FGQCscz8xMLf0DoFylip6IAWZhY41aoUSaGynGex3s2gK+VocIMx3e8QuWNuPxfssl9IzVZ3Wrlq/3w8=
X-Received: by 2002:a81:6089:0:b0:59b:4f5e:12d8 with SMTP id
 u131-20020a816089000000b0059b4f5e12d8mr2866968ywb.47.1695497168744; Sat, 23
 Sep 2023 12:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230922-msm8226-i2c6-v2-0-3fb55c47a084@z3ntu.xyz> <20230922-msm8226-i2c6-v2-3-3fb55c47a084@z3ntu.xyz>
In-Reply-To: <20230922-msm8226-i2c6-v2-3-3fb55c47a084@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 23 Sep 2023 22:25:57 +0300
Message-ID: <CAA8EJprhhUN6Txbiyvb1Jk8mEnX1bxhf-WWcDU2J2WH0uVF9kQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8226: Add blsp1_i2c6 and blsp1_uart2
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 22 Sept 2023 at 19:56, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add more busses found on msm8226 SoC.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 33 ++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
