Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDFF2EBB8A
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768685374; cv=none; b=RlcHaUKzPwsTgD16+xjFKFVFqqbrSt21gE9d1BA32NNGY1BtkL6VB+L7iBiYMN6rBnZRM1lcKK4k60XyA0WL5Mx3mIPX6x/VRaiiZx6Zn4c6/LNp5DKyC/tFrzPhwy9XFR9vhPq4QaFHZMvd+XTHqHmpImZhq5J9Hym+v2dBmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768685374; c=relaxed/simple;
	bh=+F8doHC+R3TqmCSMzKBhj25i6waFCtZIFSnjx/GJfFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spuEtiHV/LUFv82LMIctOivP2JHrrxOfmsiZphsiCZnGYbzIos8AQ5yex43HCxiuZWZ61+pYXSygegHeCFWXHemhZ/I2Bv73OW/5Z/u86A/dkzFxUdFERJ7v+HTkW4T01Kg0k1KHSG0hqk8EPQm9WqHx+XiAvGqCqQaFVwLCsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOQeWH8t; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOQeWH8t"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee07570deso21258915e9.1
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768685371; x=1769290171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=EOQeWH8t6++fSCL5s+4bYK66hju4QyqLzCl+uesRvBJAihsFtn+gW7lr+5Zo0IHCTf
         BxKjrfhccthYWiVfwFz40SKRX9xQuy5sAX7Kq2yNBpFcif7N/wAbLXq3Np2dn6RAhyqw
         ne/Jv+5jS1YakqSX5Sp8y6fDTwa0xmuFjqP3mr3lZtqeiSE0iNgtG86W4E9iH8wmJJ4U
         pCwyJg+0u5bptYkEojuYJIZQLLh/rc1frC3ZrxSxLLWg/fcqL6OkI7gvP677SJNDsWqO
         qdoFFW4OKigRPfsZCjAh0oI6Pi4bzYzDIyoCYNI6z59J9L4dd4PG28ZfO1DsBphYew8K
         en8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768685371; x=1769290171;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUZkLJCYosO47GkqiURTbkox3qlRh5JiUOfRD1pS/eA=;
        b=dmO5BfCGM+iXayf/gaxwhWaqBC7gRwFGwgeH6Q56GiiuSug4flQONRR573EsQGqeqn
         iFpgzSn/kSFm8TviiEwjbv89wMzgnUbpfQ2xIIcVJzJbqNtL9CTvNdT+sA0qjxoMy1jl
         cpCeqbCMMc8yyLNrmlYeQQq1Xnkt5lhFAZe2VMpWPlEEBL+xnyeXfshWledBsdDIjiH5
         K+B67IkqgcmX1wd8AEktxMp9iYiJ+/AII9JyOZYBKkXmoPdufNURNf7FcKXKLG7Eh6ee
         zvP7AHyVFROmNozad0slROPHK/V4ZBm45VAvQnLAjIjtcG1AMRU8DcjC5ke22G++41Xb
         ip2g==
X-Forwarded-Encrypted: i=1; AJvYcCW7/0GTDR88N0zKT19SYNSwGRzBw9HorcA/AECO8rb33bVm8WR/cIIuRL5QhlK29Wf7f+9B+2GGo40Uog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6WrqEiRIPaIQyt6OVwmIX5ZAAqhlOK2R2Y6r79jKOaXnyt2u
	M/JHPhOonrmMLK5f4flKMjd/AH/pC9T3DpruV7MK4pPjkuF9GiqoRSAH8HzaBUnBuI0=
X-Gm-Gg: AY/fxX4LHphGhNE1mdtp8jMzg8+CQmN3x1PhgG0wkOE8sdCROBCPH6BVoeBBYG7ZZIg
	HmC2OLOG6Gu6JcM4jXca6mVA6qqHAPjMrCyN1OBYzsJ6IbqOxHIWFAlgzf8xbe961hwcjykpnzY
	X51ZDzTe7WXtFYPyTrt+/F7NWC82G9Hkd7PJHAMoRN0bI9ePtn5MhBD5JBt7CGhg/BSx3Tlzvju
	rXo4lyccDuNZjMz4ZWeoiQejjL9FzIm2VkXT1LbSH7wDktKv0n0DEh7/SojM9ssyznNISqnkrlD
	g7nUzNDJRxB7VLm4KIQCwMNDsG9Xmyo86CuLBDOeDZryFg7ISDL5sPNu2MK/s+/X8RaYvniHa8W
	PWFOPEXrsN4oREKKsrOlEXSOwnmP4fTmHsvjM3sqQgR2smLMBz35bdcCQykQ6+A8Q4+Ny0gy0yB
	R7rb8SOYj2Sz2+lDBG1ZevNDyzw9KT4As3vIuMq0HU9wSg/JRsh9Ue
X-Received: by 2002:a05:600c:8106:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-4801eb09208mr70457285e9.20.1768685371142;
        Sat, 17 Jan 2026 13:29:31 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fd3bcd2sm51156465e9.1.2026.01.17.13.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:29:29 -0800 (PST)
Message-ID: <1d4531c3-c73a-4990-8752-d9b4190c9c8c@linaro.org>
Date: Sat, 17 Jan 2026 21:29:26 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
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
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-1-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> +	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
> +		lncfg->clk.pos = mipi_csi2->clock_lane;
> +		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
> +	}

Just wondering as I look at this code; is it possible to set clock_lane 
to say 0xff in DT ?

---
bod
