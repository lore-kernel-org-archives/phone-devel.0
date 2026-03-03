Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C9382383
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534340; cv=none; b=Ngcnh4LKcEKhGIkqp2LWxOcIe2QAxLh7idZOmZXCvuER67urYen74ejRRIcCbOUAkpD8xrop6QYpEWZ68aUIUzIEbUCc05P5v33BNwdgBPbByA8zHmOuRLGlFEpImGkdpGqyqodTqfdlu0gPVdbZmx7cshiIQu8G7tQsKpv0m1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534340; c=relaxed/simple;
	bh=Xhw0Xz/0Ox1gpbJ4gKGz6yQieQDrmSq8KYg90eBej54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggkphYgR4I5fWfxisY723rbyWkwNpMMKpxVApWpd1mnuinUoxUsBzpv5BG+lt5puB1xt4I2e6qaHRr7NjuaF0e3Rw6tMRS9M3dLzOdUYIDfHCn2USAgcvLM3Qjd3PzMRLLWfro1O0GZZg+tUdlghpzx3Ckx0250q3Al22dvfzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HopRlnmb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HopRlnmb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so2089122f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772534337; x=1773139137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=HopRlnmb6nM0zXzz5Bt3pWK3UFzkM1wto0nwlKqt+xig6Rid8pIU8X2NglC+Vv8TXu
         EIdxanUwHGC4VQTY7cLd1M+iKSthIzKBKjkVfKZj1isABxAd2uowp4cz4Y1At2wT3RWw
         rFNCYWkw/Vj/jJ5HY8JCfYyynbK5/6CRGgqJRwexeVYPHrnMMAgj6/sLb8l5ndvsXiAR
         vEfY3Y48Nzms7JRRhmTZWQc6I42ZFLlUc8gprgMGaHV4l3v29MpcTY2tSvCT0ATR8isk
         m0XphBSbgSsw4a1CFxGIEYaOFjH46EGe8myTvS9I6WlCo+OduSgtQ8OYPlqUOzrCMrWF
         XvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534337; x=1773139137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVTrcbnLIBcUyVxVUPeNd0Av7sj7G10io20/2X0Zv4=;
        b=s49RBWQfXuy2HH/QTFnSKxer+ngfX3HsRWZKtQwfEYeRU/G5WaLdPbExZpTcBOgct0
         dj59SxLQEUm89HTpaYHXiAxR6w03L0GwaTi0Z2K9fZJZJnE5UPlRotHbLFXVxgKMdPxN
         Eaq8OiYXNz0XopvmAiVuJSu0bBT1vEOSuIXbU+UUCAHJ8SIuDqkrEvS/EcWlrneM5/H1
         rlnzk3Qr6qUfNepMPHFTUFxottZqdQIrvO2ePMoL0P7g4BBt7rGwN6c8BDnp176uf3Qk
         +npxTXYVfNky240sTjhdfD8CzPZMZaMXBBuedL/Lt1T/rzFWthSnU4ZzAX0z505TeJVI
         mSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoo3fLVWRm4q9fChGuHzUFwjiBoVSn5DY3qT5wy1RWSnqSg8kovH4Sx2bhTho5xmEtseZ/GgVaPPtOgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeG/d/9vLYgL0Yo/hR6lMnDWbQkH2LzwVfk3MGk8uYm9346tp
	leuI3nxQu8PmAvOy1gZ9+502roVxltM2+7mzllWIZj//p7VB4YHQfk6vTSO9tj/jGtM=
X-Gm-Gg: ATEYQzwqrvc9rlRc02DnFmbHIYsLshT8p012y1SAQpr3CtlXKp49cD/bZMh23QVsJry
	j7D2aiO2p/gO/iXEoHfFmhb2t+gxGLX9XG5ZfsFQkgJYJ1PABLQxQQeR4lPejiwXT5ZbyhBDQIx
	UWIf6hn3GRTOBlVoBLmsq+vWCnkHf3sXeK/6DnzWP7fgZxyPYP/Wl2/IdNKDsZUUjAihSJlt1rg
	j9SJrT560HmOCecsqq7vaY/UP9jiSAxClq5WHK5GIjdvgjuuJqvc0JzThL2dy0Kb/uicTtpkzT9
	bGa8IgKIFfJwlEbesn2DKbc2ld24EAHHDsMzRRvaYUvsu5JzH5Kmpdw4hsYTeHGEGGiuj7udRnu
	H5JFsU+7n1XBVYkE7yuDzYNTQuYx5Rm5WF9hPP0Nd/Lzpne8CaQmBwZqVIWAz5EueZnzjXtBlV0
	TtQUhCTz1jEUkM3jVEtdL4DeQCqz+NigY4zdUPeSfCEJkNWSQ/0654pA/prquFcjPG
X-Received: by 2002:a05:6000:25c1:b0:439:905e:1236 with SMTP id ffacd0b85a97d-4399de0b748mr28113369f8f.2.1772534337547;
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm17020410f8f.12.2026.03.03.02.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:38:57 -0800 (PST)
Message-ID: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Date: Tue, 3 Mar 2026 10:39:07 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
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
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2026 10:22, Konrad Dybcio wrote:
>>> Squash down and Co-developed-by
> Suggested-by, perhaps
> 
> Co-developed-by usually reflects pair programming and requires a s-o-b,
> and that carries legal meaning.

Hmm yes but this is his change so he owns his own Co-developed-by and 
his on S-o-b ;)

---
bod
