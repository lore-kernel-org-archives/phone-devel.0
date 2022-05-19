Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AF0C433F5
	for <phone-devel@archiver.kernel.org>; Thu, 19 May 2022 08:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbiESILs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 19 May 2022 04:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbiESILq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 19 May 2022 04:11:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146B15F252
        for <phone-devel@vger.kernel.org>; Thu, 19 May 2022 01:11:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id n10so8385782ejk.5
        for <phone-devel@vger.kernel.org>; Thu, 19 May 2022 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01228AsAW87u3V4vkE8Gdp75PpcK5YiypQ0QBFNy3Fo=;
        b=fyqnVlGla7N4lQ5uwn8e1++nR5hMcVfH7kXZQI8dELebvdx5wPXYCoEaQ4C87TZKZb
         qH6CdEFNVlapKLhCj99xyjQxf1VcaZ5TtbUaMKjoLY/in6GwqZcXS+42KdFB0vUzPvQx
         lzfvA3ZG3agZdJ4K7WGDR3LIwxpLVJycMi1YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01228AsAW87u3V4vkE8Gdp75PpcK5YiypQ0QBFNy3Fo=;
        b=exHoMSvODMgHyXceJZ03B5wZRdQSMfu8tV1aeHVMhzuHl8+McgDVsLq8CiWMEiwup3
         1Z62+6dwQ2QDzI+aOdaav9eBHvj3Dt7brfr7ci5jAQvJJaB9QbT+seWTutuTxzjjgFj6
         YNo2iwaLq3KAbw964EixuB5tlLy7F/imWpZRdY0leQQ7b9Gm203ARa3fBQ+UC9lkmV8g
         9DmN4qwUcolvSkQ7AKJwerVk1tR2AeMjcxNYM4R2o4vJO8QeF/0DwQcb+rGeff4za0Ue
         G8qb7qs031zsCe819PF8oneWrURsazHXZLimUatNUycd24dGJw6ELSDych2DDQywGcj2
         Qd1Q==
X-Gm-Message-State: AOAM530MI11CEOPM60Hvsc/Ng4n+VINiGrls3k2gK9Qapi64FwVfm4bf
        3AvbIN3a0zIQ+XNVvrfjFC+zaVrL0rddyo1s3gPtsg==
X-Google-Smtp-Source: ABdhPJzdkLMSSx0pz3mvtK7JWYgQo736KqrmG37YE3VmOXM1RmsRocrZV0O4P9+IYgPClG3/SwjKr46CzO94QFvxqI0=
X-Received: by 2002:a17:907:3f8e:b0:6f4:4723:4185 with SMTP id
 hr14-20020a1709073f8e00b006f447234185mr3050546ejc.359.1652947902583; Thu, 19
 May 2022 01:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220518111652.223727-8-angelogioacchino.delregno@collabora.com> <20220519045340.11198-1-miles.chen@mediatek.com>
In-Reply-To: <20220519045340.11198-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 19 May 2022 16:11:31 +0800
Message-ID: <CAGXv+5E0k1c3f1KnhUFs-kBVYqLH726UvhAaiBk=NMkR7+8H8g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com, bgolaszewski@baylibre.com,
        chun-jie.chen@mediatek.com, ck.hu@mediatek.com,
        devicetree@vger.kernel.org, fparent@baylibre.com,
        ikjn@chromium.org, jason-jh.lin@mediatek.com, kernel@collabora.com,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        p.zabel@pengutronix.de, paul.bouchara@somainline.org,
        phone-devel@vger.kernel.org, rex-bc.chen@mediatek.com,
        robh+dt@kernel.org, sam.shih@mediatek.com, sboyd@kernel.org,
        tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
        y.oudjana@protonmail.com, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, May 19, 2022 at 12:53 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
>
> Hi Angelo,
>
> >Add the clock drivers for the entire clock tree of MediaTek Helio X10
> >MT6795, including system clocks (apmixedsys, infracfg, pericfg, topckgen)
> >and multimedia clocks (mmsys, mfg, vdecsys, vencsys).
> >
> >Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >---
> > drivers/clk/mediatek/Kconfig                 |  37 ++
> > drivers/clk/mediatek/Makefile                |   6 +
> > drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 157 +++++
> > drivers/clk/mediatek/clk-mt6795-infracfg.c   | 148 +++++
> > drivers/clk/mediatek/clk-mt6795-mfg.c        |  50 ++
> > drivers/clk/mediatek/clk-mt6795-mm.c         | 106 ++++
> > drivers/clk/mediatek/clk-mt6795-pericfg.c    | 160 +++++
> > drivers/clk/mediatek/clk-mt6795-topckgen.c   | 611 +++++++++++++++++++
> > drivers/clk/mediatek/clk-mt6795-vdecsys.c    |  55 ++
> > drivers/clk/mediatek/clk-mt6795-vencsys.c    |  50 ++
> > 10 files changed, 1380 insertions(+)
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-infracfg.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-mfg.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-mm.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-pericfg.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-topckgen.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-vdecsys.c
> > create mode 100644 drivers/clk/mediatek/clk-mt6795-vencsys.c
> >
> >diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> >index d5936cfb3bee..da8142dff3c3 100644
> >--- a/drivers/clk/mediatek/Kconfig
> >+++ b/drivers/clk/mediatek/Kconfig
> >@@ -259,6 +259,43 @@ config COMMON_CLK_MT6779_AUDSYS
> >       help
> >         This driver supports Mediatek MT6779 audsys clocks.
> >
> >+config COMMON_CLK_MT6795
> >+      tristate "Clock driver for MediaTek MT6795"
> >+      depends on ARCH_MEDIATEK || COMPILE_TEST
> >+      select COMMON_CLK_MEDIATEK
> >+      default ARCH_MEDIATEK
> >+      help
> >+        This driver supports MediaTek MT6795 basic clocks and clocks
> >+        required for various peripherals found on MediaTek.
>
> Thanks for doing this, I was wondering if we can use only COMMON_CLK_MT6795 to build all
> clk-mt6795-*? like CONFIG_COMMON_CLK_MT8195 style:
>
> obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o \
>                                    clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o \
>                                    clk-mt8195-cam.o clk-mt8195-ccu.o clk-mt8195-img.o \
>                                    clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
>                                    clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o \
>                                    clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
>                                    clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
>                                    clk-mt8195-apusys_pll.o
>
> So we do not have to keep other COMMON_CLK_MT6795_* configs.

+1 to that. I'm not sure if splitting the Kconfig symbols by subsystem
ever made sense. Either you want a fully functioning system, or you
don't want support for a given SoC built-in.

Reducing the number of Kconfig symbols also helps people running randconfig
tests.


ChenYu

>
> thanks,
> Miles
>
> >+
> >+config COMMON_CLK_MT6795_MFGCFG
> >+      tristate "Clock driver for MediaTek MT6795 mfgcfg"
> >+      depends on COMMON_CLK_MT6795
> >+      default COMMON_CLK_MT6795
> >+      help
> >+        This driver supports MediaTek MT6795 mfgcfg clocks.
> >+
> >+config COMMON_CLK_MT6795_MMSYS
> >+       tristate "Clock driver for MediaTek MT6795 mmsys"
> >+       depends on COMMON_CLK_MT6795
> >+      default COMMON_CLK_MT6795
> >+       help
> >+         This driver supports MediaTek MT6795 mmsys clocks.
> >+
> >+config COMMON_CLK_MT6795_VDECSYS
> >+      tristate "Clock driver for MediaTek MT6795 VDECSYS"
> >+      depends on COMMON_CLK_MT6795
> >+      default COMMON_CLK_MT6795
> >+      help
> >+        This driver supports MediaTek MT6795 vdecsys clocks.
> >+
> >+config COMMON_CLK_MT6795_VENCSYS
> >+      tristate "Clock driver for MediaTek MT6795 VENCSYS"
> >+      depends on COMMON_CLK_MT6795
> >+      default COMMON_CLK_MT6795
> >+      help
> >+        This driver supports MediaTek MT6795 vencsys clocks.
> >+
> > config COMMON_CLK_MT6797
> >       bool "Clock driver for MediaTek MT6797"
> >       depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
> >diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> >index caf2ce93d666..57f0bf90e934 100644
> >--- a/drivers/clk/mediatek/Makefile
> >+++ b/drivers/clk/mediatek/Makefile
> >@@ -17,6 +17,12 @@ obj-$(CONFIG_COMMON_CLK_MT6779_VDECSYS) += clk-mt6779-vdec.o
> > obj-$(CONFIG_COMMON_CLK_MT6779_VENCSYS) += clk-mt6779-venc.o
> > obj-$(CONFIG_COMMON_CLK_MT6779_MFGCFG) += clk-mt6779-mfg.o
> > obj-$(CONFIG_COMMON_CLK_MT6779_AUDSYS) += clk-mt6779-aud.o
> >+obj-$(CONFIG_COMMON_CLK_MT6795) += clk-mt6795-apmixedsys.o clk-mt6795-infracfg.o \
> >+                                 clk-mt6795-pericfg.o clk-mt6795-topckgen.o
> >+obj-$(CONFIG_COMMON_CLK_MT6795_MFGCFG) += clk-mt6795-mfg.o
> >+obj-$(CONFIG_COMMON_CLK_MT6795_MMSYS) += clk-mt6795-mm.o
> >+obj-$(CONFIG_COMMON_CLK_MT6795_VDECSYS) += clk-mt6795-vdecsys.o
> >+obj-$(CONFIG_COMMON_CLK_MT6795_VENCSYS) += clk-mt6795-vencsys.o
>
>
>
> > obj-$(CONFIG_COMMON_CLK_MT6797) += clk-mt6797.o
> > obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
> > obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
> >diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> >new file mode 100644
> >index 000000000000..766e83765cbb
> >--- /dev/null
> >+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> >@@ -0,0 +1,157 @@
> >+// SPDX-License-Identifier: GPL-2.0-only
> >+/*
