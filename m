Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484527E7F0
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686868; cv=none; b=A2kCqW/7wDdPh2Yl/2F7FgrSV/90GHOfJyX1Y4ua+aifQPNHk0v8/30q2uVMyp954cfL03MinzJuHaWzq79D7BUFnUzVa88vVziTMsa4f9GKVwx/rg//UhDlL8sq2ds5LSV4trrKrmWUHOBC1q0e8Z5/a68Zvh/7Z41iKdozJKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686868; c=relaxed/simple;
	bh=61farPWAS3rdz5Y29Ms/plzBMDmfaogO+QU+97XcWXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=moKakx3HrOZb7q2Vyx1JgferXyh+14Gmql8/gO9SzJDi9iDbnOMo5xC+Ny19o+ij6m2aIqIo8Fxw0RfwDxK6677dQcikZbOvzL7X19nWObIWTPHiDI43iXH6FF9bOjFtx2aqQLBw0AGdBWzFy3KDhp0qw3rwjp4nrdlRpBB/820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXlNgR3b; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXlNgR3b"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso20771015e9.2
        for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 13:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686864; x=1769291664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=hXlNgR3barPPKa/aL5zVbt7XW8e/0iu5L6x7pnN9dGm7rinFAK0FBwMbD5K8+hWm+0
         FC/iUTkndob1IZDmLNln/UeDyr3r5bBgVv4/iT0xRhdiUFrXyTwLLReSt9KpOm36mSLc
         /GBD9oYMlVvg8MhS6qfGWb6KjcrHIEtbIwBXApmH0gzdeiV7zifF2I/VTXe92WUB6ch+
         hLIiee6yOpNBcDflBG5rHejvF+rL9g98u2NcOSLCXw0dE8yaB8k+ycuz2y8hBvxB1VjQ
         BEabnDHwCsWfFLRHs7WzIr9z7XkD3dFLQoQeENNUT2zsiuRvPtUHhvfw7IGOAaEKw9rn
         3jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686864; x=1769291664;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwPNYfeXiQuitQb++/nMJ12hS+N4b8LejrqLKmJ1Kx8=;
        b=GFTaX+uyUd+BFqWCYB5U816ITbO5G1svvoTaXzg17iXqjouYyIiwwCQPw/A07eGdcM
         xsy4Eupr0Krmx6Ab+uZk1tpf1UW4K+NHvK4q5mdrUEiXuFhfIFGIXlvXc8zsX6SC9Qh1
         x56ASflxUSQSPEEtbJ9AAPraL8bnAr1wXV9YNKmAfCH5uhTx6JxugnsS256cngarN+b9
         5mSOeWuIKStHWZEgiYCnUioIbagBRbhu5r7xMfIMo+gofNKm0HYrQDQXyYnp9U75AYT9
         WGq6g98t2wstq3zbsKP6aD9ZInOh8r+7o7BGkvFfexEbu/f6jIKu0BHgSxfYzq8RvLY9
         O5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXGqj/i/mRqkHPxfaBM/FsEo+1V2YTqkZLzW/YTK2i/rQPV05HIaAaPIkmbT3byYQF7/At1BREuR22gqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3vamrPKOeAl0UoIIpx6j+3Ezu16a83cPGc+mhg2mF4RuMBJ1
	mzA6WK03cRXPCX4dTGLMgkvi3B+Jn9lHJnynvIAMypkY6LMhIwln8EjAL+OrZr5yq7Y=
X-Gm-Gg: AY/fxX6TbrZvNw86n5r9q4Z7b5RIUAdgsmzEq5a/LnA8PrMdXWAYXbSetSLQBsRtoCY
	TRhrrNrDJQ2oi3T0GlI4I/ng+AwMzvfc2EjYN8A24m513ASs1BCxXfYwVfS/ZqWg4ELOZLT2L8Y
	RxJeZCFMNQgTajlcDvwZXkVqRYV/dX2uPUu2ddBOikM/SrB5G1WWspnIkGooFOSwefpBRln0sWP
	VDJXEtnbZkXCUy2fFaKe61EjLnr1Pc4PQxqBWpQZBJxItS77H54uZfLKGVtOr/Rx5iIN7+hWW1t
	H4lYDTnIpcthxCjk5Rr4aM3gT0PY6WjXQkyVmpDzhNsLmW0pFjNWdUP6q02XUIAhC/16R0HEA3d
	TGtSDY/nIkDEgX3IsyPtOKXLSmi5zxcS3pwDxt96jZh37TFcf5t1KUPpoEVdGL0+adQdkNdxzCK
	CZX/11Cn0KPcJJS2UDR2JSJTDWuRnumJmkn2LRCrp1arnAH4Y3WMvp
X-Received: by 2002:a05:600d:6413:10b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4801e400518mr65526585e9.29.1768686864184;
        Sat, 17 Jan 2026 13:54:24 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm14234007f8f.31.2026.01.17.13.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:54:23 -0800 (PST)
Message-ID: <25313d70-2d7b-483a-b1cf-493f0697c6cd@linaro.org>
Date: Sat, 17 Jan 2026 21:54:19 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs own
 lane configuration
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
 <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-7-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Catch when C-PHY configuration gets used on SoC with CAMSS missing C-PHY
> configuration lane registers.
> 
> Hopefully this check will disappear as these lane regs gets populated.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index d82a88dad74b5..89bfe3710fc3a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1217,6 +1217,22 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	u8 val;
>   	int i;
>   
> +	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +		switch (csiphy->camss->res->version) {
> +		case CAMSS_2290:
> +		case CAMSS_8280XP:
> +		case CAMSS_X1E80100:
> +		case CAMSS_8550:
> +		case CAMSS_8650:
> +		case CAMSS_8300:
> +		case CAMSS_8775P:
> +			dev_err(dev, "Missing lane_regs definition for C-PHY\n");
> +			return -EINVAL;
> +		default:
> +			break;
> +		}
> +	}
> +
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
>   		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> 

Proliferating special cases in switch statements on a per-SoC basis is 
verboten.

Please find another way to do this, you already have a bool to indicate 
cphy in struct csid_phy_config {} so at some level CAMSS already has a 
bool to indicate what to do.

Please make that logic accessible to logical consumers throughout, in 
this case the CPHY code.

---
bod
