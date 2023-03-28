Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD8FC76195
	for <phone-devel@archiver.kernel.org>; Tue, 28 Mar 2023 09:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjC1JWS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Mar 2023 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbjC1JWP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Mar 2023 05:22:15 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBAD59F1
        for <phone-devel@vger.kernel.org>; Tue, 28 Mar 2023 02:22:13 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id r187so14175236ybr.6
        for <phone-devel@vger.kernel.org>; Tue, 28 Mar 2023 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679995333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfEbC+QvlmYRFEpM334dDDmHLZzT53TFZ7pAp7zhwe4=;
        b=O+6rpHUxMrocg+PNRSUNrl09ruDw8nFucVYoEuKiSkUoYU+rAaaZhtmXvt6TdGkwNP
         M1b8yBJvevc5Zt7Jyzawt3sUx2+8btHWzfMFZYbqpV5ujpvuCnm6uUn66khGbaDrI4/b
         BnOZaXOaZ1QBeFNUU7FRBwi2CjsBQzbK8g1XLS5nhmorHOweLMGd0v+/YX2qMdHObYeV
         flOhgDotNum9SI+7uxyc4MfExqnGRtrmIxceFdg59KEnFajy5Cv80DUd+NdLRx8k3RA4
         7LEesg4hoH8OgLFhlxClH+aKYg8loDZNrIsxSLEo9AIGjCJ+YOTdQbIxwY0yUZUkHLT6
         Rexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfEbC+QvlmYRFEpM334dDDmHLZzT53TFZ7pAp7zhwe4=;
        b=ZL5xhIkU6Kr8ROuzjv8CeW/cdx10Cg1a/Y2ejyjTMwkyI+TMGhmxpl/OHbYJOB3hEa
         EGt309u/lZteg3h/TwnkSSl6KsDadA8celxHFx+whAt0xOUNP9aR2p3pswAWMXgwIdGf
         3py3CyQRx9tDcMDBJxCQ3PbFL2OtG1vRqh1IyhBC+jwUGz1xPR+b2uUR7CzkVjbG5wYX
         5PVgps39c3SxDX3/3HsVGcC5YHsRpl13PdIdQRQA9WCurAYJMATznrLQB/Qp9gptct/z
         rqNwN+RlYZ/gBJAgfHlORFlqNrMoI0JnZlh0lGZ0nGwk6fQd3DVAnJrnkY+no9ST1NtL
         PBNw==
X-Gm-Message-State: AAQBX9djxWwpqRXCBr8cwHQeri9GmQ1Ot8foOPDQGaUW+JA7elbKqn60
        Xmv3vtMKhQi7dD2AWO6dCo/qY5Gv5s9CGHxuQaUElw==
X-Google-Smtp-Source: AKy350auimLGCr8ILoBzGItiYAiR4pgO8LPEdWrnD1Vk5Z4GVtmW4pyg+5kEg5lZTH5zOTSGFwsCl8xX2CPkdVQT06U=
X-Received: by 2002:a25:a2c3:0:b0:b78:1b26:a642 with SMTP id
 c3-20020a25a2c3000000b00b781b26a642mr6658558ybn.1.1679995333140; Tue, 28 Mar
 2023 02:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com> <20230324094205.33266-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230324094205.33266-4-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 28 Mar 2023 11:22:02 +0200
Message-ID: <CAFGrd9pjm97+Et-auw2rh4nWUJAcqXzy2cix42QJRx4UHNzq2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, flora.fu@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Le ven. 24 mars 2023 =C3=A0 10:42, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> In preparation for adding new members with name abbreviations describe
> the struct pwrap_slv_type with kerneldoc to enhance human readability.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 5c500be48f7c..a33a1b1820cb 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1218,11 +1218,17 @@ struct pwrap_slv_regops {
>         int (*pwrap_write)(struct pmic_wrapper *wrp, u32 adr, u32 wdata);
>  };
>
> +/**
> + * struct pwrap_slv_type - PMIC device wrapper definitions
> + * @dew_regs:      Device Wrapper (DeW) register offsets
> + * @type:          PMIC Type (model)
> + * @regops:        Register R/W ops
> + * @caps:          Capability flags for the target device
> + */
>  struct pwrap_slv_type {
>         const u32 *dew_regs;
>         enum pmic_type type;
>         const struct pwrap_slv_regops *regops;
> -       /* Flags indicating the capability for the target slave */
>         u32 caps;
>  };

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre
