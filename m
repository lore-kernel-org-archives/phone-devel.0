Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625805;
	b=aXrpv6GGf4C55VrqmHtPQFr5YWkfSpqGRYj0zbSoz3GYwaLTN3tlqN0mwpY/PMKku3GO
	 b2/XaTYYhgtV3DniBhuj9L8hph03AfeSO/3bnOqSo90sqyvihP/ClCv3bRfraBy/bIMVz
	 JrJzMbp33F/mwFGaQQinczy44ZSWQUWPlg8si7coo881P8ZgZ/4nRBQgPa+0A84on8HIL
	 mpc5rNI2nUQSmxKJAC1kwpd15oecmC1R4aao/ie/h005JW2AI7+9TnUGxno/nwDavqcc8
	 OsEGo5P/1N184vvD4HbQ+YtZUsBfxL9bvdW9XzuqAMjiX83nCaMkdZgQhXONmS72dug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
	b=Ee/p0h8Q+RwNja81BUKNUuyqqlPoQxc1fhCgN1ZdASAIDhzxxf9+nxKPeAriRFmaUouJ
	 uoCc/ePA/9TFhSReW1uyeClLUTZ9mF3yglEyMFE6JBTGqk88L70fWkFRxcrRoiS/uOlPE
	 hmkQjQj2FjGDi8wgC38veA92nzMiIVW20zlpxIfZrC+ndCurYiSDgi2h1aIiXPcb1pE3V
	 vgr1DFdpZ976AlQfL+y4XZk0R3EqXT+t+M+QcS5WBHQRmP0z2t1R3JDq5EZpauG5EsI1Q
	 XGAdvMvY88gGMXLHqi+97doDixH610UYAAV9BEnBFhf7eUdwzD4mlTHU2hRcRlqUa7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=grN4zMxc;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE16606A326
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 13:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE16606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=grN4zMxc
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1545830f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 05:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625803; x=1794230603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
        b=grN4zMxc7oQlR98hYUkHCZ6Yuu01AtMNd9fxu+r0BRT4eb0ZejEnXA5JACGs2/7Qaw
         cHX+/SbLjGcmL9T59knvnPl5nbQo7oivB8DBZFuuqi7Ryx6P699t/5uRTVH7i+o/vkKa
         +4hUWvktNsWR75ynl9CeOQRky4Y9GQ2Dp6QX2FFpvvHwZZzBBEiw+losE3FWyMVpqioQ
         /lUy+HIp4IMM+E5IluYwt5g03Jhpu+fmyg6lqcxv6NfA36WD8cmXr1MAw+tSUS8WxfYl
         GvwGKkg0PyofYvOLBvUIpGLiwpGYtNKb9L96yyK38mt28tI015jVBKCejbDhk8m7Dteb
         VmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625803; x=1794230603;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIx9bq7eJtm+GqnApG7n9pCm9nsbzo/SWmqkbsdi7fI=;
        b=TufHp7efL7AFXajRi7Z5NFdSQyMY1xOc+j94JrF9lPvyer+HC1tlaULIV0Y2mTRoAs
         m85yCvafs/mpMJgdJlCIs/Cd+kKfTiYwVml15O4laERjA7ZeLYelRqoBnmD9rnyFyor7
         IgfoSrRr5PT8X6Y3dOCmnZggvbcjzeJ9cQDpMU+LU+m7ibpkVmOspP1i/Ha6cWz6IKeY
         p9pMIN7hQyh/Bwa4oxmAk1D/StZ/p7WhSK8dc2Ve2l1RMdPRYmFJyPsqQ8KPOHOizQ3z
         OcqqDkZ4YGqlP0rrdx8CHtwa1oLkREAb/ZCN1BCO1+QrRAMjTi4RfCbuwRzQhB4frtcT
         Q9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwdNUTFCbrcCs9yduKNukZmBBiAXHdhRJCin6jFUTAmtsIGUOGjqreLB/+OJybt1Jl4BO8T2WxQqQL1vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8d9CI8cHd9JBoDlqytv7SPhIf4D4ZlyX3HqC8zW5YVBobxyxM6
	Ju/0Ydyjk5+/mhFKRfm2wD3+4JbeT59Jp/uBHERSpHZs0xRKeVa4jxluVcOAk5J8wUo=
X-Gm-Gg: AYBFou2Qh6uxzz+xHYYZIcbOXsNREzFu33t9Vl47A4bet4bQiDg4iISLdcbixEqq5RU
	E0hNKzGiCxxP9ZC7OPQTcG3PIvxJKc/RGUu3iibj1dgJfNTX8/BnLsFfZX7KYjWITLTxp1b3RYW
	NACetCXmzTTOwuWQ6Zb8IiC8tCbsg3X3G1M+Ydzihl7/PDU4qLuVstJ5J2DyhFJaiJy2HEle0Wh
	JUe+4nzd/NO8zpMoxb0e6UZrDKMTQXlB+xLpGjSxjmCeBKbAZ2SAUD+kglbCiIv+MZ6EWh6Vnpa
	eByR163eUqM6xnN3H3H/Yrs4ghzKN9DUORJrcPesizhqfZMdONwYmZ3IXKQjdjs5O7nP36l/s+k
	XuRljxa/1SJWhA6SoUQBtPifrTvTkrR2x3SoXd3huGA0o+V95xn9yftlNaBdtmEd2d1sPxPuLkW
	nGTyrGQ0g+AhhuQLUCTeegfQX3jVZ1/LUwGs/SIfhd5rbNSR5ce/4M7HIJJXNkWO5f2CDV6l6aK
	JFozqSBfc3yquw+Gtd7BEnWiToZkTusNZ7zYPETqkx3QCYhYVSzUPOp6/lf2nB9REbZSV4KNr8m
	//CzAyC2JsiiD+wWaDr5quyTOYOnAUwnusaMD153hQYFoXl9GeUtylRiSuW46CSjmhXsDikhUdB
	RwHEbaA==
X-Received: by 2002:a05:6000:2501:b0:488:654b:ccd8 with SMTP id ffacd0b85a97d-48e6e2bdb0dmr23565416f8f.6.1793625802634;
        Mon, 02 Nov 2026 05:23:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm19912671f8f.43.2026.11.02.05.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:23:22 -0800 (PST)
Message-ID: <75fc5b39-d038-4643-b4ea-a6eb6f903650@linaro.org>
Date: Mon, 2 Nov 2026 14:23:21 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/9] drm/panel: novatek-nt36672a: Combine two init
 callbacks into one
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org
References: <20261011-nt36672a-panels-v3-0-9ea238627f8a@minlexx.ru>
 <20261011-nt36672a-panels-v3-5-9ea238627f8a@minlexx.ru>
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
In-Reply-To: <20261011-nt36672a-panels-v3-5-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 13:54, Alexey Minnekhanov wrote:
> The split between .send_init_cmds_1 and _cmds_2 is completely artificial
> and unnecessary. Two command sets are split in between by the sequence:
>   - exit_sleep_mode
>   - delay
>   - set_display_on
> 
> But not every panel driver follows this "split" in their init sequence.
> Some may have different delay timer, or put exit_sleep_mode/display_on
> commands into other places in the sequence.
> 
> In order to make this driver more extensible, combine two init functions
> into one by puting exit_sleep_mode/delay/display_on in the middle,
> followed by commands from cmds_2. As part of this step, also move the
> tianma-beryllium specific deinit sequence with its delays from
> nt36672a_panel_unprepare() to tianma_fhd_video_send_deinit_cmds(), so
> that each panel model can have its deinit sequence with its own delays.
> 
> No functional change - full init sequence with all the delays for the
> tianma_fhd_video panel is kept the same in the end.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
> v2: move tianma_fhd deinit commands into its own deinit function
>      (set_display_off, msleep, enter_sleep_mode, msleep)
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 61 ++++++++++----------------
>   1 file changed, 23 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 73bec4f47ec60..a445c8067aa5f 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -51,8 +51,7 @@ struct nt36672a_panel_desc {
>   	enum mipi_dsi_pixel_format format;
>   	unsigned int lanes;
>   
> -	void (*send_init_cmds_1)(struct mipi_dsi_multi_context *dsi_ctx);
> -	void (*send_init_cmds_2)(struct mipi_dsi_multi_context *dsi_ctx);
> +	void (*send_init_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   	void (*send_deinit_cmds)(struct mipi_dsi_multi_context *dsi_ctx);
>   };
>   
> @@ -92,20 +91,6 @@ static int nt36672a_panel_unprepare(struct drm_panel *panel)
>   	if (pinfo->desc->send_deinit_cmds)
>   		pinfo->desc->send_deinit_cmds(&dsi_ctx);
>   
> -	/* Reset error to continue with display off even if send_cmds failed */
> -	dsi_ctx.accum_err = 0;
> -	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> -	/* Reset error to continue power-down even if display off failed */
> -	dsi_ctx.accum_err = 0;
> -
> -	/* 120ms delay required here as per DCS spec */
> -	msleep(120);
> -
> -	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x3C = 60ms delay */
> -	msleep(60);
> -
>   	nt36672a_panel_power_off(panel);
>   
>   	return 0;
> @@ -140,22 +125,9 @@ static int nt36672a_panel_prepare(struct drm_panel *panel)
>   
>   	dsi_ctx.accum_err = nt36672a_panel_power_on(pinfo);
>   
> -	/* send first part of init cmds */
> -	if (pinfo->desc->send_init_cmds_1)
> -		pinfo->desc->send_init_cmds_1(&dsi_ctx);
> -
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -
> -	/* 0x46 = 70 ms delay */
> -	mipi_dsi_msleep(&dsi_ctx, 70);
> -
> -	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> -
> -	/* Send rest of the init cmds */
> -	if (pinfo->desc->send_init_cmds_2)
> -		pinfo->desc->send_init_cmds_2(&dsi_ctx);
> -
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> +	/* send init cmds */
> +	if (pinfo->desc->send_init_cmds)
> +		pinfo->desc->send_init_cmds(&dsi_ctx);
>   
>   	if (dsi_ctx.accum_err < 0)
>   		gpiod_set_value(pinfo->reset_gpio, 0);
> @@ -192,7 +164,7 @@ static const struct drm_panel_funcs panel_funcs = {
>   	.get_modes = nt36672a_panel_get_modes,
>   };
>   
> -static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi_ctx)
> +static void tianma_fhd_video_send_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>   {
>   	u8 reg;
>   
> @@ -352,15 +324,19 @@ static void tianma_fhd_video_send_init_cmds_1(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x51, 0xff);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x55, 0x00);
> -}
>   
> -static void tianma_fhd_video_send_init_cmds_2(struct mipi_dsi_multi_context *dsi_ctx)
> -{
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	/* 0x46 = 70 ms delay */
> +	mipi_dsi_msleep(dsi_ctx, 70);
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc4, 0x54);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	mipi_dsi_msleep(dsi_ctx, 120);
>   }
>   
>   static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> @@ -369,6 +345,16 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xc3, 0x01);
>   	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	/* Reset error to continue with display off even if send_cmds failed */
> +	dsi_ctx->accum_err = 0;
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	/* Reset error to continue power-down even if display off failed */
> +	dsi_ctx->accum_err = 0;
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	msleep(60); /* 0x3C = 60ms delay */
>   }
>   
>   static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
> @@ -399,8 +385,7 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
>   			| MIPI_DSI_MODE_VIDEO_BURST,
>   	.format = MIPI_DSI_FMT_RGB888,
>   	.lanes = 4,
> -	.send_init_cmds_1 = tianma_fhd_video_send_init_cmds_1,
> -	.send_init_cmds_2 = tianma_fhd_video_send_init_cmds_2,
> +	.send_init_cmds = tianma_fhd_video_send_init_cmds,
>   	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
