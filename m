Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC21DDDC
	for <phone-devel@vger.kernel.org>; Mon,  8 Jan 2024 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PNWqQl/F"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso1510173276.3
        for <phone-devel@vger.kernel.org>; Mon, 08 Jan 2024 14:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704753957; x=1705358757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=61vUXi0tgd4fMed9J9uoxBpNCsey8YSSXrnUW+ulNLI=;
        b=PNWqQl/FdRpVM9bj0dlCNnvlPBNmoraXuMJeoobUvFRXA9udGmmyK7IpHit3gUEhIo
         QJ2RxcHbdnVpNxR/9baDf2RehFed898pqwI7jZ0Ui7yfD1tBZXwpgfH7cBP/aGRx3SZ3
         e3KAf05cVU0e5ZO/old7O5pPhhAqXJExU1KFjnsxOJc5Ft+4pLYl2I697jUtxchkGaZY
         ID6lKj8uGU0oGbbbreVf5EMtZgYglxpa6ozD+6NrEoovU6sCpJ3KFG1GcmRMmdncavG1
         +oAhuUO7kfYwulBgb+awis4v2u9/kp1X5PIjwtkGrcjsTm37X3olbNtUDl+yxuaQpkti
         2wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704753957; x=1705358757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61vUXi0tgd4fMed9J9uoxBpNCsey8YSSXrnUW+ulNLI=;
        b=FjMrlo7eJm19gxCOMA9HBY3+iwWM2zuRw89swv46F2Zx/1289Y7Imb4twKoIBKTXu/
         IE17zr3tFtUhP5sUY0x/KGISVQtbUA/duRJCvN15Rql/6Frxbwfl+knZ95FP1T8OgWO3
         6ADOjpxZ0CtwBzk9h0EuEiA096fjj4tl2/px8padASglZHiUdHhRIpRvQxuvdC+tlLFC
         8jdFz9boY8gm7g/W2hiEwtsow6j+70VHJcY69WlXqnjgNyV+iOMBBwa/XjfqXXD1vq/z
         o0U3Nv4OAktG9GYkrN1FHo8TFXI+5uJYexZdSG9+VNuvyUbuHx/tJRoud+DzYEhOsh7y
         VUhw==
X-Gm-Message-State: AOJu0Yzyq/V4EGpa1XOHznhqBmaKnNdhz07OfgDMT5jTMLuVd2ZyImS/
	+2B5N2G7NeDyC+z0iy7+9Nr1yLrQh3z+UqWS6lTYkvXeQ6OYdlZw4GX/zXkX+to=
X-Google-Smtp-Source: AGHT+IEbTUjqNatHT4gZuq1lWHFVUpKFk7infbpl05RXJCta6U4kfHgnNQE1QCFhn2fuxApi7ertKDi3IRZ9ZKYgkJE=
X-Received: by 2002:a25:ab47:0:b0:dbd:497a:f546 with SMTP id
 u65-20020a25ab47000000b00dbd497af546mr2316231ybi.0.1704753956710; Mon, 08 Jan
 2024 14:45:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-sm8350-qce-v1-1-b7d586ff38af@fairphone.com>
 <a5923bf7-0a05-43bd-b282-b45e5653ac4d@linaro.org> <CY9E4ZCHOMWU.C18NR0H7V1QX@fairphone.com>
In-Reply-To: <CY9E4ZCHOMWU.C18NR0H7V1QX@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 00:45:45 +0200
Message-ID: <CAA8EJppCAMXds5F4bgeb9VJSwph-+4ekVsJ=rGib5=RR5m0DPg@mail.gmail.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.linux@gmail.com>, David Heidelberg <david@ixit.cz>, 
	Stephan Gerhold <stephan@gerhold.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 16:23, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Mon Jan 8, 2024 at 3:18 PM CET, Konrad Dybcio wrote:
> > On 8.01.2024 14:49, Luca Weiss wrote:
> > > When num-channels and qcom,num-ees is not provided in devicetree, the
> > > driver will try to read these values from the registers during probe but
> > > this fails if the interconnect is not on and then crashes the system.
> > >
> > > So we can provide these properties in devicetree (queried after patching
> > > BAM driver to enable the necessary interconnect) so we can probe
> > > cryptobam without reading registers and then also use the QCE as
> > > expected.
> >
> > This really feels a bit backwards.. Enable the resource to query the
> > hardware for numbers, so that said resource can be enabled, but
> > slightly later :/
>
> If you think adding interconnect support to driver and dtsi is better,
> let me know.

I'd say, adding the proper interconnect is a better option. Otherwise
we just depend on the QCE itself to set up the vote for us.

>
> Stephan (+CC) mentioned it should be okay like this *shrug*
>
> For the record, this is the same way I got the values for sc7280[0] and
> sm6350[1].
>
> [0] https://lore.kernel.org/linux-arm-msm/20231229-sc7280-cryptobam-fixup-v1-1-bd8f68589b80@fairphone.com/
> [1] https://lore.kernel.org/linux-arm-msm/20240105-sm6350-qce-v1-0-416e5c7319ac@fairphone.com/
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index b46236235b7f..cd4dd9852d9e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1756,8 +1756,8 @@ cryptobam: dma-controller@1dc4000 {
>                         qcom,controlled-remotely;
>                         iommus = <&apps_smmu 0x594 0x0011>,
>                                  <&apps_smmu 0x596 0x0011>;
> -                       /* FIXME: Probing BAM DMA causes some abort and system hang */
> -                       status = "fail";
> +                       interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "memory";
>                 };
>
>                 crypto: crypto@1dfa000 {
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 5e7d332731e0..9de28f615639 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -40,6 +40,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/clk.h>
>  #include <linux/dmaengine.h>
> +#include <linux/interconnect.h>
>  #include <linux/pm_runtime.h>
>
>  #include "../dmaengine.h"
> @@ -394,6 +395,7 @@ struct bam_device {
>         const struct reg_offset_data *layout;
>
>         struct clk *bamclk;
> +       struct icc_path *mem_path;
>         int irq;
>
>         /* dma start transaction tasklet */
> @@ -1206,6 +1208,7 @@ static int bam_init(struct bam_device *bdev)
>                 bdev->num_channels = val & BAM_NUM_PIPES_MASK;
>         }
>
> +       printk(KERN_ERR "%s:%d DBG num_ees=%u num_channels=%u\n", __func__, __LINE__, bdev->num_ees, bdev->num_channels);
>         /* Reset BAM now if fully controlled locally */
>         if (!bdev->controlled_remotely && !bdev->powered_remotely)
>                 bam_reset(bdev);
> @@ -1298,6 +1301,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       bdev->mem_path = devm_of_icc_get(bdev->dev, "memory");
> +       if (IS_ERR(bdev->mem_path))
> +               return PTR_ERR(bdev->mem_path);
> +
> +       ret = icc_set_bw(bdev->mem_path, 1, 1);

Probably this needs some more sensible value.

> +       if (ret)
> +               return ret;
> +
>         ret = bam_init(bdev);
>         if (ret)
>                 goto err_disable_clk;
>


-- 
With best wishes
Dmitry
