Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488002;
	b=Ep8wEO5zjimENNtpyKmevGJPyPXb6o4sJO1FtMqInOMWHajIk2pAt8chfgcPYR+CPY7z
	 A14k38ZmwObMK2SSrPXRXLeqRJTLxWWZkEiXHbHzzekvxsp8td08Zy3g8hSALQFAWdlaH
	 Z2KhhXCnbCant7BAxAkkJlFD3fHfAwGSxggHBCG64kZ7r5b4kujQD81aEK+y37vo70/Gg
	 cuC74yqqbhHoCYFB8O03t3phhjsz5W9rx6GFdXOkXUXxDB4QtZXVyQb4B7XB1IpgKwIsP
	 jfiroUIPZNZmV3V7GHLKt07z84fz3bASf3vbBuqBBw874I4fTpOxGTtSuhrYnCm/dTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
	b=zR9AONp53KaXZYjh1D6n4F0+eGZBfri4p6nhRbshsEIPNk6uAU2UkejzMRF97xh3i5E8
	 98DXC3kPTchv/iToyhb5lDMrLuelig93cxMwlV4zkAoWjao+yg8auF+8d6EXZYvAANbjG
	 XuVRqcsXkX6kA95QQw112SqACAWrDv7YKPH4npLYEH98pLA0BX9Luz4ismNoRCiKXx3ik
	 rXyPZfqvvB13P+4fXYVZWnGGHsW31NDGrfEdUIZuJCfRw334L+frbIpUrhSJXdQU1iaGP
	 On1CpBQvF9Mtsx9hGDKhOMRZD0C+5W5keivexTafXYCcmFwIz+B0YymVjHWhkK442QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rI/aYFEJ";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA5606A319
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 09:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBA5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rI/aYFEJ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so20838855e9.3
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792488000; x=1793092800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=rI/aYFEJvfYmrkEMAwT9ZLOtYYvsIN2RzloIRTCc8l7swAy7LLLpN28HihTkCBXvPh
         +Mdgk4fDkZuQjt391FMat60ZEYACOcoDWDSMUjaw+qaC4HDH5HQFk5sVcn5jUw/PynfR
         Twms6EMcr+RogweQ8HSfe9JMTjYkbT2LMlDy5SLmwMXGoSL6gNQsx+fAdcF7cvb2kdc8
         rhxKkmz2Z5iS1pubznLpIKpbGZgl9HijlQhMzUGiKb7zJTm4dL/QtbS/wNwthIHQDNOF
         CETV9wgcrIYx/yefAXaNGs1jI+Zbyk6nAsqpoPVN7Ym9fmeVfgx71/KL3HR3lPw3kuR8
         8gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488000; x=1793092800;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvtetNybFvpR2bcqOeI5rfwt1MRTMkbqxUE2U+5+8c0=;
        b=K5W+ItnchUZbQeMHESi14QO5REnMTUOvJyG1l+K/oX8rdBJKxl9It53yUB+HLW7C8J
         J6AVIC44eJyETnwvs5nQpkXAZ+UcZDJYOT6w9h8GRoHgY9gRnp2s4mwaoZqjaAmtOP1T
         2R5CO7xQtZBB0txOoeqfl5zjnlxf/TTh/0jtqpcmD20T6BLLyglfHxh4IVggX4a5Jp/o
         W6eow7+nqz2dmXWlcSAsEtWoHi6Ghe2EBHvHu553rg/yyT3KD83hX9oqgHfjRkRPx8PQ
         llhbMZw8ovM6LotTkiinpii2I1JlPTVS7NoKxGC/DFdLR/rj5NJn2WeuorV+Y2mzmxSN
         2nGA==
X-Forwarded-Encrypted: i=1; AKwUvByrA8TwSNAwyFtI59frC99Htw8b1QKi3IReVWT9O/Z5XI4O2ZhjGqCWucg1N/ePw7Jo04W3Z3utIEfxyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJlZ9DXZB4ckPvwSHLZtbyIohxBhucFDlVg0Db2VtqA0f6Szvq
	cwrnM4fv4rbYxxx/o9tAB0w6onqiObAoyPF6rdAhDZYSbJm+yDfW+0CvR/w7CtlZBKsb0AjG9Aj
	8p/wM
X-Gm-Gg: AYBFou1H9DxOxcDUGgSpMDi7T3tftT1j6nE5cXDvaXrghETzKegWmF2+1buGrIJPmcn
	0z7iSE5ZZ8aew3Mn+gq2ybEvLnfcO/7GkwDhjnwBjvbdKkEnehctDKiMvlihl1dpIhsqgyNI5BW
	Xu2FJGM8n2JDZt0S9Aj9p34z6Vi3ESPVTPQvpw2KS80MKYTOFddk9T/h5LF0G6r7cJxL8dKqrZJ
	pPyfhBaqwHsYZOWt5prAr152DOKjybsWDX+ySFn6T/ZRUE5N/mbypV8yYsaguvwfMfjlMVFpKFB
	Aj9sE+7LxdOKtH9opQ/8bTg+7PIKaIA/FrorfIgw/ZDFBCEkO6CG0Z59pIpkvJ8t4zM9wfDrvpU
	P7jEh7LVgijlJjKvgYw/1XMsxLiJ2+VnzjFwbQWNkQq1ZljLYnwDkl+cjsD4NzuG4iGt/ONzns5
	swMKDvt/NLxLkaQG5dyvaYqWGJ/wwy6FJQDNAeidpm3Z7TmK8r5dPj51vjhjsIk2e3FO8PoeOKY
	Mcnz7PvN7iLNZeNmkjwGoMSx+5lus8kLLLHwJgrIlPjiG2oylrcz18=
X-Received: by 2002:a05:600c:3baa:b0:4a1:e586:6328 with SMTP id 5b1f17b1804b1-4a1e5866352mr167712225e9.12.1792488000132;
        Tue, 20 Oct 2026 02:20:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbbb0sm4872571f8f.5.2026.10.20.02.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:19:59 -0700 (PDT)
Message-ID: <fbb6c91e-cf8d-4bba-82cd-57f0d1b2c698@linaro.org>
Date: Tue, 20 Oct 2026 11:19:58 +0200
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
Subject: Re: [PATCH v2 3/4] ASoC: codecs: wcd-mbhc: guard against NULL cfg in
 typec_report_(un)plug
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261020082631.1509275-1-val@packett.cool>
 <20261020082631.1509275-4-val@packett.cool>
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
In-Reply-To: <20261020082631.1509275-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 10:26, Val Packett wrote:
> mbhc->cfg is only set by wcd_mbhc_start() which is called by the codec's
> set_jack op. wcd_mbhc_typec_report_plug/unplug are called by the platform
> device's typec callbacks, which are not synchronized with codec ops, so
> a hotplug could be reported before set_jack was called. Though unlikely
> to happen in practice, add a check to be safe.
> 
> Found by sashiko-bot via review of wcd937x Type-C integration patches.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0c105997eefd ("ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 850be84d65ce..fd40c1686d66 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -594,7 +594,7 @@ static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
>   int wcd_mbhc_typec_report_unplug(struct wcd_mbhc *mbhc)
>   {
>   
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)
> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(wcd_mbhc_typec_report_unplug);
>   
>   int wcd_mbhc_typec_report_plug(struct wcd_mbhc *mbhc)
>   {
> -	if (!mbhc || !mbhc->cfg->typec_analog_mux)
> +	if (!mbhc || !mbhc->cfg || !mbhc->cfg->typec_analog_mux)
>   		return -EINVAL;
>   
>   	if (mbhc->mbhc_cb->clk_setup)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
