Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB802C21C0
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930832; cv=none; b=qOX6m1241hb40TeRllbwck+WqrO4mPAFWJeZbcDJpvJUtXGSWNXQ4KAeIQ9lUs6mbREhJhWYugM5Zh+Sy7Nusdhji1tpFAqVEy0kF7YDRHWb1teEk0x01B1uvnumzkmbQ+pmVJn7xqKxPyL4GP/TfxCHyJ8q1ndbyjRrD70Virg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930832; c=relaxed/simple;
	bh=2zQVkXy8AVVI1kFEAu+O+ca58FKkvPeE77EeUvuPheI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9tOT4tYTGFwObuAOLE4gMMMvYCX1FNhPudAPax8FZpVXKmejRJWB4OuLO/FlHaM+nPU+s7Gy2CTbnp8oV5vu381C8hh/ZeKF/ktJjoNR376/aP6SREpPkpO58V57+BT6WhbSLCF/evZJwF9W6z7cyX+boZBh76RA7qhyLdXG64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBrWa9c9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBrWa9c9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b38de7940so1067930f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764930820; x=1765535620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=SBrWa9c9PfRq+QJukl83WM5I5bvPCk1IpTqyzG82YdE/4+pKsE35ZtWmdqbFu0Im0e
         7euHmSXiPj6JbVfW9lb39KiU/7htBPusriEciZsOkAQu2D8Ggtc5IbVQI++38WB7JpfL
         uyiJAvzaf3cxXDA0XDnqKaU2Eaaf4065OAK8YL19dkvFFoVC03/eB48mUA8b2SEYo2EW
         KB7ljuC8MOHuw9Q6YB1Mkhm7uRCNx49Teou4vNF00fToikZHTQuHV4SA+lwCzVrZJxaY
         32JQAhlm7SkcKUxXgbEWjeVIeg0nhGz7VveOgLbposWYD1ZnVlHX9VvrMUKJzqZVqkH4
         s/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930820; x=1765535620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAzLPSLG7AtJee+XVA0Hp+yvy+eodAcCDH7vUMbwv0A=;
        b=uXOsrVDodn0pG6svdg1UEPVqhj/QYkhXRasN3LSoC0f5d80UjEq4i3A2h9Ljggmn5f
         xloOEyYPjqxSnfGE+pVdyxWx1B5jqOSO72LQzMRtl9FoOG06tu41HFkI7X7NIiqrx3Uf
         en3uYaggv1+fNDGlVsPFzA3vxDpubzva44L3h3OuSeqU1MWazMZsg/m6KRtk/r2xdnCF
         0fn6cyghwkEVdQeAuqZeFOuBRa50KHWOZtMyUzTcA9mUlCz8hHivgQrRZ4bV96Y2ic58
         JSaUZy8qfkz55yxaFB7bbF1ZysULVss6M56KCpNoDyF76jZmw9WcSSa7ZMcHz6fbrG8L
         8MHA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4o7gIodECHRIz/G5f3Lv2WJvD6gr0cgkAEnOjdPbmVTALO/Ha3u6iT6VUS1cMOmr6PP8OVz09z8QVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3PjavOBggeHhq6m0ti9AYDGPvGMfzpNWDss6zeXOW8CP5yDd
	SEr06DJq5Bc4enAMaCnMEb/L7uyCU2G+ut8M9lcJyyCnpMHIcA48P73JaTXMhQj1154=
X-Gm-Gg: ASbGncvZVajEasiUF9FfadcqWWY64n8Y9y2CPndVVI/BOEIoCT2/1EoJqaJuc99e/dM
	MlpwFrngfjQjYX/IwG4yy/7MaN/oWULdbmeiA01R7x0VuX1TwZu+QwOUqxCZM9fcVPBz/rpf9+g
	AU8pacOAGElMooz9IRfFffHzqeCPHl6e9TBuHa1faj2VzcanvsNNuV91Nt72rSgAe7plxwOcWy6
	anXFBl+WkYwi1NXzsOUy8EHa/U6fQ45CIu/26CUsi11bE6/VoKdvv4KUdKq1kNOQW4D+HI5DBS7
	Nc+Ekxpuz9n6rbxLH//E5X6WT1atYNN4nT5T9PJNvx0dpO6h3rVBie6jGYgnoHHbEVQ1zUabTbw
	MpD+WZgtOHTYN1adxgann+cKaJ5sacZp3sWMvTcbH1X8OJXJ7T6IW7Rfpdex8c9pwx8lVrdL7rS
	Nsjb6RBWrX+2LdusjXAeJELfk0xL1TNZzYCBWxJ6RP/sgui4xOWgzA
X-Google-Smtp-Source: AGHT+IGmr8vG9r+BJjkWvvjU7SasEQlgu0FAyDtwLcxQqvgN22qOU1pGX5mKZsJ2hiueUbXQHUz4hw==
X-Received: by 2002:a05:6000:1449:b0:429:d170:b3d1 with SMTP id ffacd0b85a97d-42f7320bea0mr9668770f8f.59.1764930820250;
        Fri, 05 Dec 2025 02:33:40 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee50sm8133308f8f.14.2025.12.05.02.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:33:39 -0800 (PST)
Message-ID: <f76aef3b-5886-43d8-b15e-6513abf8e58e@linaro.org>
Date: Fri, 5 Dec 2025 10:33:37 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 2/8] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251204-qcom-cphy-v2-2-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 16:32, David Heidelberg via B4 Relay wrote:
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (int i = 0; i < lane_cfg->num_data; i++)
> +			lane_mask |= (1 << lane_cfg->data[i].pos) + 1;
> +		break;

What does the DTS configuration for this lane mask look like ?

---
bod
