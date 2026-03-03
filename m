Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EAD38C42E
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531745; cv=none; b=IaT8YEJYdbdForAPanwetx48VaXEvOF4ocLo7OVjR/ooGyGZK6maOGzPT5/yIykvr4blexN3SDKRFDGcfONXwooRPJ8gx+BJ6yWX3hQAitbrDi3v+HcYDic0Coy2bBsYSnjxxKmHFr6N88m0lMAooXt9ETJUunj5kMdA/QkJCps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531745; c=relaxed/simple;
	bh=XfEQZg8O1NwywMbwrjVuCdoCa1sFQb9IBIllLzxCgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6vQ6eJOMOudyuc1WXLXAeXLZlgtsGjeSwFFAZmnJwksDp2FHWJIa3cPBIvOwzKG+FVlLv4vprl3m0Vyv3J6DCjkFtsvWvGNg7UmoV0EWBw5XyxReXC78KPRgZKGrdNdFvZI6qyTyJ5mVyLg7mlbqFXFZpOrfliw3wLB2unz2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXDWwTpz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXDWwTpz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483a233819aso52593965e9.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531743; x=1773136543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=xXDWwTpzcfIpZk/BnlC2pRpX1mlJiEZcQsysfzAXgw9qfjHD/Wr1Jjxrz/NbCoEs9W
         h5ZC2mOOscdUKa5Qz/NVMt4FHZk6ipS0Himoa0ZUg2QQ3hcyECe0bSwmr1QYFDcDVOrG
         GK7LjZvoNsuA6b/RzqWJQ+fFJUgmnY0jsxu+84nE+N6IvXO5jHL7riHUa7NbMuCshUHE
         dM1UyOdi8M45wGC6nhl06ZcyXUbZMls+UqTGb4eo2rc7/1g3j3ZYWgFginoKfvQrTxL2
         c6YTuZ7IVAqKjWrGaLXE3FOYM/mh21bjTsUB6tsNiFfKjua6EprUTIK61zErAeMhNqcf
         13eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531743; x=1773136543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8b78R18+qD2EcN3iJ6PBq/vdbXQerYBeT4QKKh24O4=;
        b=xCRUt2dAf6UVfC/NpU+Djnrknm5OmEUUIIsBQxC4URSP8h8wr64YXN916lShVnp+Dq
         yOJA/veZT/NAXRYh5r01xVoiPO7+vsMDjodxP+Rh66ZehmUNGY59RFka1GqYjN/V6ukh
         /ma3NOS2isJLjA/uv2W2MITAIW4sBsblodUfMtSzTzbX+SqpV2rZ89m3W8j68Zxnlb3W
         YcBzw1BoWU47oJEF9CaE/LdE68WgLRjOdVi7vdmaNcYfFosJRFYkqIwsteOVztaHbkkY
         PptQ66lo/wg1hojRuPQcCZLSjwdB8qJ72D83HzGgcwleSfoPrLYOU3XudT3dL4wBV2Pf
         P01g==
X-Forwarded-Encrypted: i=1; AJvYcCXrHhF/XxZVKEwjw8aUoEPq9zkuYauRFJv0fj6J0kkLFoxgcnubqFvRSzZISX1vH+WUooc8PveK9QdEZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5YuU+scBQjTjpoLtyuJqua0Wouxc6P5A3TfRQUdFqxMDwz6U
	yYKMYkpGa+qTPoTd2e9bZ1b3HBMR4KUP515iCVJpePaUZa3qSm6252ALuuRetuQz3yE=
X-Gm-Gg: ATEYQzxdiGtMm+IORXmR7cmmNIN8YnS8JcKfLbqXdl4Yw3dWayeOuMKF4SyzWpdi0s/
	6wKfT4rm7xhy0BwajGVAa8HTxtvvuCPJ6+1omBK2p1EWT5LJ5Lkl/fmgAvhyawfwZjgDZK1PfO7
	opxbJzqPVUUSTfP7qAeDsCR/9HNo8MpoIDrGlnjkp5kgBsiRnN1EhnX00u0gJbRKPrt+guwM3Kq
	IY4aJ9uKLGqi5jE8UaEK7Mw45AaMt6wOC6r0yJkZd9XFRi8/tMg0xkiftZKazA3arg7bYw1rCaT
	FGxDbNCtCx/UpePDdPbB5kre9dON9FnY+cIh7EJq+3NEgdV1mq2MgWnEcnZTi7+KwRJEuzLracj
	JOjeDHQ30ISMwm01qKR8LmvnfCWtSl6EvQloSVWOwddVopIQiKtH2iNoAR+nUryaMs2tM9MZwpn
	GNWzrpwkMTUW/wXa6NZ/BDODb1dbw3/CXi4hoEGKurqs6X2FYOlBAeL+qpaDKPouQj
X-Received: by 2002:a05:600c:8106:b0:483:afbb:a064 with SMTP id 5b1f17b1804b1-483c9bb7b7emr255369825e9.1.1772531742805;
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125ba6bdsm14310115e9.0.2026.03.03.01.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:55:42 -0800 (PST)
Message-ID: <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
Date: Tue, 3 Mar 2026 09:55:40 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> These values should improve C-PHY behaviour. Should match most recent
> Qualcomm code.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 5482fb5163e17..c612192ee727a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   /* 3 entries: 3 lanes (C-PHY) */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> -	{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>   	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>   
> -	{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
> -	{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>   	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>   	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> 

Squash down and Co-developed-by

---
bod
