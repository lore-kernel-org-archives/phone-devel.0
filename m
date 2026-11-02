Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625775;
	b=JtHGGVNeuO4O3JT8AXFkAfUVCEoBohDf1umeGxbDJQY8Ux99avJHOwoQThOTV7cv/Gye
	 qgUIxb2Fe5Tx6GxpEI3YN3y1WEsMF++fAn5n/i/fz5v1LHeYPP43xxPC0jELUpBQ1NF6E
	 x8cX9sE+PdWfYFrbaRluaMeQFmXMDpv8T9YtWdwOpS3ERhseTzg5csSCKUJx5LXZRjzhL
	 RhIsf4TJOkqmmwyciHRX6MvkccEzVpRp/HBzOLSjF15uw1WQrhXHdyDrETmQ7Qk9QtgPp
	 DNmeSU4w3dGA9OtPl5a622ZTErvDAjEOilDjfrlySsbTDUs9XfIaxAIJww1gY8pwQqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
	b=w/lNTxfxUz89Y7qVeGlmjWnkuMISbYTbNZc7EMQZEqAVlOJQdkHJmJxYCPQyaaVFOkzO
	 /zOpP+dX+MjJwHFwIc0rOX2vitdbOsqCQdNeUe8DvRKck2Yo1Ds3PaN6RBFWwQfmktl7D
	 T0kQqhaRueOrkqnQh6PdKH3eeRGSK0u+c8W/LYE/hs+1ooqco/is/eexdbDuxVerhZo1+
	 eDQmM3gakikIFp4Q+E+Xqth+Dya9GBBUPrbnODBexIrMFQvnSfZ5xJz5l624GXEhuYooO
	 fUuJIqXFv+/SoCE0nNwD5kwpaS1rgc0cxIF5plEDVvCNMNGgeb/JwdvM0nt6wr0RBXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="A/VAmHu3";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1E606A326
	for <phone-devel@vger.kernel.org>; Mon,  2 Nov 2026 13:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A/VAmHu3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so1671345f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Nov 2026 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625773; x=1794230573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
        b=A/VAmHu3lU2LSY/R9EliSoPwYWs/3Rw3Zg4pL21allQ32gj3bNHbB/Ue9iVMJtEftM
         LoEa6hyzUPUyKiWsV5tpqoPl7cq2YnDzmHyCchIC2ROEmBZUdW3lp/vvjLhJCRFqiR70
         W+yLV/YwVUKCuoErorE10SxEvKQZ4eEI/et5177eGWxez6xroPANlZsqx19sP6hfKJeG
         VX3l8J9y1keBAv0vdlTw3xVLwwN36rbuV7gRKuEcLQlWQmUtVRgR9ymRX36ylKoE9IcY
         8asa2mbfDlU5Qz5EbiF60DiF9d5CxZU/HJr8MCU4Ci+aQRY+JxvA2/5ttTrFNClU57ci
         g7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625773; x=1794230573;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOUwoJJ2xHQgVFDnHDlORcv3rq2tKQISQ2U/UtTWQ6E=;
        b=uZ9xfExHOMtsD6ZBlzkkDK1yu+5X9VKqm5qcs+e2L9LP7p7quLY+6v2WJNg2tGNS7+
         roDodYpbM6QRNU+kkW646Mf0T9u2I6m9cxzUHdd1MoB12Wv0AENMnhlZK3Us7QGJxKNa
         9KPuhwOwRR47waVV+6YGdrgj3J1EQq8Ml1+Owae5GWGegXvzMIoUIttP0WO9A87nxJI5
         7ukZUuGdK9eEs9tnWPHHmR4vKf9HbGkWCXTIVWFEzWH/rr9MT5bQFo1JuqGDRqbFufef
         k/LPuRDSDOLBHZtBQgWGcxOb0UIFJDuZCpwgrSPf5cM2D4Qisa/hfAUtDTFIwaN5xNQu
         dk7A==
X-Forwarded-Encrypted: i=1; AKwUvByY7p1+JpFKBTnpgow3jJZAz0Sr+DqmO6slHP2XG/nspjtRNBQmA/iqfxPrIKi7DgrRcimOebbsjuUoUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z83kyPiUk6V1Ed56miahBoEsN5tY4h/ojlVRe0HrRmGehgjtZFf
	cb64t4ULCpk1/Wsdrwrwc2rgEluMDRSX+fiTm0lIBhdJRGykc0hfMS48Ce0tI/VwwNI=
X-Gm-Gg: AYBFou2/vXW6RaTT7L0cfWl8/m8x4scenx89rymBaICWFClaMebCcM2ihUwN78kv+L4
	uJryuwSe3BeBP4G/PC11w/MEbtSWSI8ULQ9TJzgl8F29UsEQFVV3Ob6DCW2lclv+bj91ob01A3Q
	zgJQIIb9OPODHvsT8wLqG96HJa04+MVV9p2TXtfNrvB0K9l33gxh6L16VM/kz4YdTn1daaiCtsY
	/4VPgKnGdHlEn8PFItXzm7serCUjCgyI7zi9wATCM5Mpd5A7rRhUL/Xpg+dyPXoh+cJwrMxMg9+
	rnSq7K87kG7t6SlMAzgzb3j17CxVAlTNRx0OX5vvRx/Ver7cmNoKcAmDABFJdkqHTDsNnOh6GuD
	iEdPwNBGNzcE+3tOPnVdi+gmFKyDzomQEGCO9f3zRv8D+zg6fth1y40OmGV4csbHJpEcw0Ad4Vc
	1qzDQQe5NkFlNzcFIjV1WKxSlNudZiFZXF6To1/7Cop3dMD8Al8nx9d+h54w+Zde28oLg1VoZjO
	8iJlmJWI41h6myszqRDHFfWZW0sLBa8PSCfiBJ+6OtDJTBEWENNvcgHiVeWIO3MvhposVzl256F
	DlXA6K70OPVe6eX+q9j8sv1HIbZVQuYTfjKjNxsNb84DXORsxFo7Ye8S2loWeQpCIQeKSw5IsiF
	CBdZBJwjtIQo9qf7vf+Xxn4hulaM=
X-Received: by 2002:a5d:6f0b:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e6e2f6772mr23661360f8f.14.1793625772934;
        Mon, 02 Nov 2026 05:22:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm19859094f8f.9.2026.11.02.05.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:22:52 -0800 (PST)
Message-ID: <07adb06a-5760-40fd-9c67-b562bbd72ad6@linaro.org>
Date: Mon, 2 Nov 2026 14:22:51 +0100
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
Subject: Re: [PATCH v3 4/9] drm/panel: novatek-nt36672a: Set driver name to
 novatek for consistency
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
 <20261011-nt36672a-panels-v3-4-9ea238627f8a@minlexx.ru>
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
In-Reply-To: <20261011-nt36672a-panels-v3-4-9ea238627f8a@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 13:54, Alexey Minnekhanov wrote:
> Since this driver should represent not only devices manufactured by
> Tianma Micro-electronics, but also from other companies, it makes more
> sense to name it according to what driver file name already is: novatek.
> 
> This does not change neither module file name nor Kconfig symbol, only
> driver identification in dmesg. This makes it possible to e.g. grep
> dmesg for "novatek" and get messages from both nt36672a-based panel and
> Novatek touchscreen.
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index 464d9ce47d87d..73bec4f47ec60 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -479,16 +479,16 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
>   	drm_panel_remove(&pinfo->base);
>   }
>   
> -static const struct of_device_id tianma_fhd_video_of_match[] = {
> +static const struct of_device_id panel_nt36672a_match[] = {
>   	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
>   	{ },
>   };
> -MODULE_DEVICE_TABLE(of, tianma_fhd_video_of_match);
> +MODULE_DEVICE_TABLE(of, panel_nt36672a_match);
>   
>   static struct mipi_dsi_driver nt36672a_panel_driver = {
>   	.driver = {
> -		.name = "panel-tianma-nt36672a",
> -		.of_match_table = tianma_fhd_video_of_match,
> +		.name = "panel-novatek-nt36672a",
> +		.of_match_table = panel_nt36672a_match,
>   	},
>   	.probe = nt36672a_panel_probe,
>   	.remove = nt36672a_panel_remove,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
