Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80986331
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776043801; cv=none; b=JOQSQDGiAadjbvUcVJlw+UL8g6/kM3mqJMgWksAyyitfWOU9w4+nG6QS7AEOkhLIEkktukKTZi6F/5s4vwDHcSwSTgfGUoH/b4lQTv4a8sMkVwcVPedWrGQngPQtvVI2F4BOl+Kcq4FrdNe4Dj4xfdQjiZR9yY7J3CULJkX5eRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776043801; c=relaxed/simple;
	bh=/Ng1kQ05/jMESpzsIddz7nP1ZGdquPHKRrNNUXHacd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHtfq5MlImQJ6UEu1T8zmG7bmjrcnixN9+d/uPIpRQlBOKGgLtRroq4A6oZEIm6Fum0Cq+jftYdEgfu4JakOQUbW25hXT+Q7XfJio0EtTE9bxTDE0oWKJ6cfvZVpXrkGXIsnWyvOcWY/ZGOXBBDwx9r8MRnFoh0rG1QFMwDJ+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJdbgUu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLImhQyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJdbgUu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLImhQyJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE51IF543317
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4xPVpsoMJBufQ32OcfsUYWbg
	00L8GVQNJvCwUVmXS+E=; b=aJdbgUu8P2Ed+ONcwpxyZspYWFV0T1V1yTUluTUA
	SGFGGWD1KRXeenfkxgFK5xtI8ru2B/i/ybI4ZfL02jqoT4qtY4Ip9M8H08B1syfB
	Y6zcrsD+W8Q6nl0cPIrivUjDZLeVzCce2e9luw6iYCxeadDrLk6384WEAjXHtcRi
	8c/gGeolsAWpo7zTT5FOoNGffgtFDiLeJ7HI6EWSLKF2ssisnhFNQUK8zvnMqM4B
	sdcyo6dymBDQj5aKGV6juVQQ1k0/ZAwLWz3I5/gp9hk4STKu7sUlObmiJhRzwVAU
	THx+lsBIJUyIH4+Le4A0BJVS+bu16qvD1nMvfIpXGUsPuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfu9xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:29:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so75973971cf.3
        for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 18:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776043798; x=1776648598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4xPVpsoMJBufQ32OcfsUYWbg00L8GVQNJvCwUVmXS+E=;
        b=PLImhQyJ+VxqbvjTyVc2I435DxeC8a4gfrlnELKXYoEI3qii4M1mM8yt2nwBj3XUxV
         jloWeX+j/gkBj1eYC+tj2Z8xEwb0VOkvIj+sqBjlVZ/VYYcDu7Ckkd1rQynk8GSNm4co
         kvgZu1dxWkijas3Xmf/jjI7vytpNcm6fsl8gAD29CcWFpX8ETxCrCblpCXQV4x4ge+uV
         SijB8cHkFQNMJLmYVAvHTXUG+Sc5nTWaXoibE2Vc6ea0TSgL029xT6CwN4bACs111VXm
         kl1OyDP2alGPwfYGSmVXrnMKweFn0oIoOxbBWU6cMoBFkGzTfr/wkP8n9KLG0YOFE//g
         zvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776043798; x=1776648598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xPVpsoMJBufQ32OcfsUYWbg00L8GVQNJvCwUVmXS+E=;
        b=P9VXuuzr8Ln3vo7l85fQRk91N//rpBJaHdxjOYa/iOFryxZkJfRHF41bchGhDM93YK
         +izzK515IafPLmq+rweP8QJFJ2R4VXZ1YRMDNwzAcklahvYHz3B7pyk4AYPE45VwHlyh
         h2oGgfcc4ihFimPiNuwgRTtQhHyfZcw4fUV63xLSOSBr0ggbHhT1umB2Ff02VyP2cxUG
         dTmm0w/YyouhzSk3Vo2aJNPckHC7dIMhG4jeCFWIYUDkat4v8aInqeNo4wm5/jvlVwVV
         g46WSkekdwf1UnQidQhCpgXd1O2V5Qe32IE9qNOg/6zOPw9Lxz1aVTxHvebAhoOe7/I4
         MMpw==
X-Forwarded-Encrypted: i=1; AJvYcCUbyYacPm2fquUytGQOFO8c2j6CVLogWx2zQ7I+6CAwsqaFPzISNHlljhdJV94Amy4chK3N0DxS9iTaMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wHERnxgkcOOtme2BKgWNK/g5MkxlCs7IXHeftsQkvBXHH0HU
	zgKoiXYgLwibFwlrB4HwnKiX4XzAa2+LQdnXe+AYT7v8BbI3N/Aex7eAfW/eITyJ5m+PHqbpbq6
	G4G0tpUwe4mArBtT+sjDhQuezctP4KSY4MIr78490Va2Qhn7IPVNYrZn2oQNT+l22gw==
X-Gm-Gg: AeBDieu+M1jUgkVMKuNrgf59FrvvqN0FTzmvR4S3hqqcLDM4Vro41R1PtSa+fNMFMSl
	rCI5w2VwwhMUDBsVZ1rWVDjTNE+faRIs6yKllYuU8cWuPVnOJzFGRF2ZTIw0A4mNUIXCl8WrRP0
	BuagpMMHuvirEhE75pwBnN3JfVVF4k0CqiI1ixws1DMELpVdik4edDcG1qBImsFze9YyRLLBup5
	kIrJMZE4lyN3poM/NJxb0GHCaRLnqYlKLsTZk+jlWiPF90hd6HGK9GRx8orw2id+Hz379NiMUnq
	OBN/fDVoj82hbgCEGuq1j2Z7tUdaaD7xAqwDBuVeOV6F7eE5uNg9IufutcW0qlbLxEzfQn+HKTB
	fpgl4Bbfq2NOAN32nkxuyagegIT9/+5s0Xv7zXDBeNKvdicp8ovMM+KElCUJ9E9DL+r4bumZvoM
	IKtlzoG+eP8s5Z2Cz2o0P8My01W5pkUboxauU=
X-Received: by 2002:a05:622a:13cd:b0:50d:97c1:6626 with SMTP id d75a77b69052e-50dd5b30de4mr175660781cf.7.1776043798435;
        Sun, 12 Apr 2026 18:29:58 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:50d:97c1:6626 with SMTP id d75a77b69052e-50dd5b30de4mr175660371cf.7.1776043797933;
        Sun, 12 Apr 2026 18:29:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4927037fsm21064871fa.3.2026.04.12.18.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 18:29:55 -0700 (PDT)
Date: Mon, 13 Apr 2026 04:29:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alicja Michalska <alicja.michalska@9elements.com>,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] drm/panel: Add driver for Novatek NT37701 based
 OLED panels
Message-ID: <7iwz3mveqwp5cmxajgsnfnzyffewxkweesvywsyacxsdfmdqi3@qlwgqzw2upee>
References: <20260412113851.355944-1-val@packett.cool>
 <20260412113851.355944-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412113851.355944-3-val@packett.cool>
X-Proofpoint-GUID: -gNQuySWXv5QSCoc60-67XeAn6rksbSW
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dc4717 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Jt1seR1F_FQkLTMJGlMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -gNQuySWXv5QSCoc60-67XeAn6rksbSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAxMSBTYWx0ZWRfXw05riTOCpaaA
 4cujHGX/8ZydQnQPXZcWPIkeUmrOI3RZfcyYA7wOt8sDB1C7mBy5uJcS6o+O4y766JUP2gvIRdQ
 IXl5m2y7au1FJ7bhyAywquYQlZalOp6yvFs/EHY9XmuYgFRP9PbCiTMFUJx/kIch04UDm9v01vX
 XWLCawx/z2cSjgfzxGHU4NfoJ0wFJJTsslYYHDZBQYihyJT6xfUJCjjJlHP307y5RPFY8/yjizH
 HS9ZxkXm8HElG6Mm8jhfuug/00t08410ffatmZuUfw3JyJx9ahhQtxDdwNJSLLwONqlAVZY/iOg
 gXEpArLF/CUqJuGQR5QnlQaRwO/3QNF8FlTrKmZl7OGaUxaoI9aWUxrRWo7PKE+mIsxaGNmrjkh
 +kyYTCDPk7vX8+IZjrV9A6oEe/8/4Mo0QUemqsMXTJdbnnkDejvzccVr5CI/e3RNYS7NNju2YHj
 F8iiCbUlHG8QWSUjP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130011

On Sun, Apr 12, 2026 at 08:00:45AM -0300, Val Packett wrote:
> Add a driver for panels with the NT37701 DDIC, starting with the Tianma
> panel (unknown model) used in the Motorola Edge 30 (dubai) smartphone.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37701.c | 532 ++++++++++++++++++
>  2 files changed, 533 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37701.c
> 
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905b..183f968a5333 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
> +obj-m += panel-novatek-nt37701.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>  obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37701.c b/drivers/gpu/drm/panel/panel-novatek-nt37701.c
> new file mode 100644
> index 000000000000..ea8a208fecb2
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37701.c
> @@ -0,0 +1,532 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, The Linux Foundation. All rights reserved.
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/of.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +enum nt37701_mode_idx {
> +	MODE_144HZ,
> +	MODE_120HZ,
> +	MODE_90HZ,
> +	MODE_60HZ,
> +	MODE_48HZ,
> +};
> +
> +static const struct drm_display_mode nt37701_panel_modes[5];
> +
> +struct nt37701_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline
> +struct nt37701_panel *to_nt37701_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct nt37701_panel, panel);
> +}
> +
> +static void nt37701_panel_reset(struct nt37701_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +#define nt37701_panel_switch_page(ctx, page) \
> +	mipi_dsi_dcs_write_seq_multi((ctx), 0xf0, 0x55, 0xaa, 0x52, 0x08, (page))
> +
> +static int nt37701_panel_on(struct nt37701_panel *ctx,
> +                             struct drm_display_mode *mode)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x00);
> +	/* Voltage */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0x18, 0x4f);
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2,
> +				     0x60, 0x50, 0x66, 0x91, 0x86, 0x91);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3,
> +				     0x00, 0x08, 0x01, 0x5f, 0x01, 0x5f, 0x02,
> +				     0xa4, 0x02, 0xa4, 0x03, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3,
> +				     0x03, 0xbb, 0x05, 0x2f, 0x05, 0x2f, 0x06,
> +				     0x91, 0x06, 0x91, 0x06, 0x92);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3,
> +				     0x06, 0x92, 0x0a, 0x2f, 0x0a, 0x2f, 0x0d,
> +				     0xb9, 0x0d, 0xb9, 0x0f, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x00);
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x04);
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x11, 0x00, 0x09, 0x51);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
> +				     0x00, 0x09, 0x51, 0x00, 0x09, 0x51, 0x00,
> +				     0x0b, 0x41);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x11, 0x51);
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc6,
> +				     0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66,
> +				     0x66, 0x66, 0x66, 0x66, 0x66);
> +
> +	nt37701_panel_switch_page(&dsi_ctx, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x1c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0,
> +				     0x15, 0x0a, 0x38, 0x27, 0x49);
> +	/* DSC */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91,
> +				     0xab, 0x28, 0x00, 0x0c, 0xc2, 0x00, 0x03,
> +				     0x1c, 0x01, 0x7e, 0x00, 0x0f, 0x08, 0xbb,
> +				     0x04, 0x3d, 0x10, 0xf0);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_MEMORY_START,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x88, 0x02, 0x1c, 0x08, 0x73);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     0x20);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x095f);
> +	if (mode->clock == nt37701_panel_modes[MODE_144HZ].clock)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x04);
> +	else if (mode->clock == nt37701_panel_modes[MODE_120HZ].clock)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x02);
> +	else if (mode->clock == nt37701_panel_modes[MODE_90HZ].clock)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x07);
> +	else if (mode->clock == nt37701_panel_modes[MODE_60HZ].clock)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x03);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x08);

This should be coming through the drm_atomic_state for the CRTC used by
this panel. Most of the plumbing is already there, panel bridge needs to
pass atomic state to the drm_panel functions. Note, the bridge has a
reference to the encoder, so it can retrieve CRTC state. Panel functions
would need to get drm_connector so that they can perform the same
lookup. Once you get drm_crtc_state::mode, you can perform lookups here.

It's a longer path than the one you have RFC'd here, but I think, it is
a proper way to go.

> +	nt37701_panel_switch_page(&dsi_ctx, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1,
> +				     0x00, 0x03, 0x03, 0x03, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00);

-- 
With best wishes
Dmitry
