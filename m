Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E3934DCEC
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641575; cv=none; b=HPuQbGLlpRzVXRNvWwl3KNqCVmNTfEjkFurKtHWk/Bq0j1WdjD2yQ+FeTFhEen5GAL4BNJX/y++9MuCoeIwLgjcxLwU/Pq0IwAE3hzFn3gpMh6flQTGBlpswiRgk7I3R77GMpahcPPLvW5Dhp+KxRkHZt+Q0fxMEfmHPTd4mab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641575; c=relaxed/simple;
	bh=hN9Ke+tpFcR/wGaDz+lYn3JRd5Ni0yP/B1f4HEGgNGo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q3T20kTjN8Uy96Z0cJH/5++YSDlcC8qDIMOYZPbmcbNkQAG1T/gT+hZjTkDiTCY7dEGWrDQ2KJVM7hbUS03HLGfoFkTF5yDu+8mTYlc0ViK6Gm7YQohcCXmMr+7SYgi2qdp2C9XIlK2Xf8C2Auf7JCNZ+PhCvRxTMXFP03Atx30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgYPvY+N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgYPvY+N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48372efa020so62654375e9.2
        for <phone-devel@vger.kernel.org>; Wed, 04 Mar 2026 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772641572; x=1773246372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IycgstOp8AUBvQFItrqTS+kIWrn5vpM6y/uf2FdllGI=;
        b=pgYPvY+NQKtuKKt3nOeRhDxl11Eieuy2PE1LLA/cpdIaBcRaFVHvItkUwB2bdGyaCe
         QAF9ENy1/+veUjcQ4oXWq6IzJoyj1p9NetOhujTClTaSG98CPVPUtbZIb8x0gLKIy573
         oI4qUu52+tXlfe2Zwx2NGhcQrZxreQjbSgy9lqvRHXSDiEctPAxf79FbN5D3D/TEj4X0
         L9Ens6eFEMtOOmvtjSxwbtjxBjko3t6eOGJVJxahWAkEYeTR0KcZq+lBopLfubeWEkkD
         bbMcLVslbrQWvKG4VVw495eJzVzycPUZgp6/C8amaq6VHghLGTLH0sdNoHkoBdp8WYs9
         9nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641572; x=1773246372;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IycgstOp8AUBvQFItrqTS+kIWrn5vpM6y/uf2FdllGI=;
        b=fNgDGx4AoB33NGUuEQ0u8O8d/lJI6isWKIm4LbOQuzZXnDKGGqF1Rpyy9Ni3+6E1RV
         39MQDTvwO9i1n3DRdrLD1N6RBUUiDQOH8dEDiGVpxGOCxWIK0iQRh9FX6uhTSxnHK3iv
         kgcNJwBS+ixzagugyXUK6I+owQq7P1XZZbBzH7FNUgs7rmwerxgVidacNDRv9I2y7BmF
         nVQ4Sp359uxVVFoxMtAnZEgIVJuVpmOeqEprMwLQxKedDjnjrSPkD8UjocsrMz+74cXb
         g4nsv2/V98zQuzHr8oFwwzeun60bpFbz25z1Hgt7gDzFuCMPuYGTYY1sMoKZGHJQbvC7
         DOCA==
X-Forwarded-Encrypted: i=1; AJvYcCX6TzMBxmQbd4YWdnBTveSBmOQ+wZ7ZEQUY0U9NfeFbr6wfCCusLtTAGKX2T5UCzKNmi/qelhek8y+Nkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63yZHsVY1jvgs+O2/J3j+icEdnBLrLFGwP0VhLfWMnucUxe/c
	/RYiGXYt5ThhTz7CS8+4hNWEdy/shcKjcqAaw4CG6lm3bCtku3s8YoZ6rHO7HOja+MU=
X-Gm-Gg: ATEYQzwYd84WLp5yHWAdiKJyGjTD2kkGs62BDKev3ax3mURqR7fu11QpH/eqi/I3kzg
	ClM2UGciQqu0/HFXsoicdIEOZ8J7W0FP7Gzkj3pyIzg/5eCqfLd3NJby4vMNZq3aB1SJ1epwgbV
	oPsTxudTMdJdIDKDG8+jmVRGnd3/asVRN3+hxFEMfPTrA/tpe/lnUZo1sZR6tHOt38/BPoQxi3p
	f8E0lZuHC26r+5rSKkrkcQpXUah6SrUc+QTWf/HhC24AK4+onDxK8xQDR+a5OXwXbgR0AO/O0wx
	NL4H+m+/JY85EXt9O4XCBQ9mp0awwsiXg3OkxJNbmPbBXRyxtUw4J1UCeIWhZMyFUwsibDjixGq
	CxxF0yttghHtyMn4gB/HV0sHgndaAchAVR4Yi8j5qyu6UQP61V7HOV+mnAKnEHcg3xNvzj0/WmS
	afT5sRvcjZciHKGKgNacdZZOo8xPnWRL5clngRzrzyITz9lS9gQegr65p0m04P9Jg9DyMJ3+M7Z
	AFJ
X-Received: by 2002:a05:600c:a4b:b0:480:1c10:5633 with SMTP id 5b1f17b1804b1-48519896e83mr39034405e9.26.1772641572014;
        Wed, 04 Mar 2026 08:26:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2? ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884224fsm62369745e9.4.2026.03.04.08.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 08:26:11 -0800 (PST)
Message-ID: <bd2bb9c1-70e2-4914-afe2-c172501c25bc@linaro.org>
Date: Wed, 4 Mar 2026 17:26:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] drm/panel: himax-hx83102: Add support for Holitech
 HTF065H045
To: Val Packett <val@packett.cool>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-4-val@packett.cool>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260217070121.190108-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/26 08:00, Val Packett wrote:
> This 720x1600 panel is found in several Motorola/Lenovo smartphones like
> the Moto G9 Play (guamp). The initialization sequence is based on the
> datasheet. Add it to the existing HX83102 panel driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 86 +++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 1d3bb5dca559..34e0e956db48 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -701,6 +701,67 @@ static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
>   	return dsi_ctx.accum_err;
>   }
>   
> +static int holitech_htf065h045_init(struct hx83102 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	msleep(50);
> +
> +	hx83102_enable_extended_cmds(&dsi_ctx, true);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x22, 0x44, 0x27, 0x27, 0x32,
> +				     0x52, 0x57, 0x39, 0x08, 0x08, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x00, 0x06, 0x40, 0x00,
> +				     0x0e, 0xae, 0x38, 0x00, 0x00, 0x00, 0x00, 0xf4, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x01, 0x58, 0x01, 0x58, 0x01,
> +				     0x58, 0x03, 0x58, 0x03, 0xff, 0x01, 0x20, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x10, 0x00, 0x17, 0x00, 0x63, 0x37, 0x0e, 0x0e, 0x00, 0x00,
> +				     0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x16, 0x4e, 0x06, 0x4e);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x04, 0x0c, 0xb2, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x24, 0x25, 0x18, 0x18, 0x19,
> +				     0x19, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x06, 0x07, 0x04, 0x05, 0x18, 0x18, 0x18,
> +				     0x18, 0x02, 0x03, 0x00, 0x01, 0x20, 0x21, 0x18, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP2, 0x00, 0x09, 0x16, 0x1f, 0x28,
> +				     0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d, 0x91, 0xa0, 0x9e,
> +				     0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78, 0x7f, 0x00, 0x09,
> +				     0x16, 0x1f, 0x28, 0x4b, 0x65, 0x6d, 0x74, 0x70, 0x89, 0x8d,
> +				     0x91, 0xa0, 0x9e, 0xa8, 0xb2, 0xc8, 0xc9, 0x65, 0x6d, 0x78,
> +				     0x7f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xff, 0x14, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xff, 0xff, 0xff, 0xff, 0xff,
> +				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +				     0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa,
> +				     0xaa, 0xaa, 0xa0, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x70, 0x23, 0xa8, 0x93, 0xb2,
> +				     0xc0, 0xc0, 0x01, 0x10, 0x00, 0x00, 0x00, 0x0d, 0x3d, 0x82,
> +				     0x77, 0x04, 0x01, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x00, 0x53, 0x00, 0x02, 0x59);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0x00, 0x04, 0x9e, 0xf6,
> +				     0x00, 0x5d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x42, 0x00, 0x33, 0x00, 0x33,
> +				     0x88, 0xb3, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x20, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x7f, 0x03, 0xf5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static const struct drm_display_mode starry_mode = {
>   	.clock = 162680,
>   	.hdisplay = 1200,
> @@ -833,6 +894,28 @@ static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
>   	.init = starry_2082109qfh040022_50e_init,
>   };
>   
> +static const struct drm_display_mode holitech_htf065h045_default_mode = {
> +	.clock = 90720,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end = 720 + 40 + 40,
> +	.htotal = 720 + 40 + 40 + 40,
> +	.vdisplay = 1600,
> +	.vsync_start = 1600 + 186,
> +	.vsync_end = 1600 + 186 + 2,
> +	.vtotal = 1600 + 186 + 2 + 12,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct hx83102_panel_desc holitech_htf065h045_desc = {
> +	.modes = &holitech_htf065h045_default_mode,
> +	.size = {
> +		.width_mm = 68,
> +		.height_mm = 151,
> +	},
> +	.init = holitech_htf065h045_init,
> +};
> +
>   static int hx83102_enable(struct drm_panel *panel)
>   {
>   	msleep(130);
> @@ -1069,6 +1152,9 @@ static const struct of_device_id hx83102_of_match[] = {
>   	{ .compatible = "starry,himax83102-j02",
>   	  .data = &starry_desc
>   	},
> +	{ .compatible = "holitech,htf065h045",
> +	  .data = &holitech_htf065h045_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx83102_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
