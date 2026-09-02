Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A34A92D1
	for <phone-devel@vger.kernel.org>; Wed,  2 Sep 2026 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363286; cv=none; b=T/JA6ZMFKdfAfEmMvXqLs7WeaQqNysNYL+a1KMiIVuPKKalpdQJ+4hZK0iK9OQd+dd+lpXq7Axou9qVfZFmyCLcDvxPTE670aGM6uQXQxIgHvWoR0TIb5xH9E0JSmfuyK5z47//SoonB/X0BY2+MSodQRiLAIUIAOdOBs/skvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363286; c=relaxed/simple;
	bh=111HryzAB3+BmsU9N8tLYwKEyvYhIGzqqk3NSmGK9+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6Ourz0oAur+xsVlzR8BEDSx2CHdV4006fFzjX9/grrK+QHvJ3OijqXwFJm7BkdvpUuyzYJy4qdM2Vk1lPX5BV2/FNK/HJ6UkcTtHNwfp+XiFyY25y7iZ49cxweTO5wZsYvxHsBJmry7qHGtBvZ32BKrpi9PRSl0mtwgvLM8At4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpJN5MBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCztkWi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpJN5MBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCztkWi4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682D51dn1076438
	for <phone-devel@vger.kernel.org>; Wed, 2 Sep 2026 15:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=; b=OpJN5MBfxd7f5L0I
	usmbjBFo1h+2/8y7RkUKk2IJkFuy8AbcnK1GzmlPlnfnjsCCSRL4asH6GM9eBJ0N
	cDUC976k1JRmxJgYhxxcGH/2s+8rdST0guLo59KiWiBzVMHF2og13jCceXKcqvdG
	KQ6VP4AkCeZcLv0XEmP/BRWW2hfvJhn65AT722CJ/hAXap2dts+ONm/GhRHsG1xl
	T5Fzvfr7YPm+NnrwIhM2+EhuG0VA+xzMJER7RJbOpgjPsWaZe9Ktlyqh1mJwfynz
	BSNNkcNFM1+aYz7WkCEoINJ0EmLYZ605DoflJjH4VSwcRc5jBa2yt5cEbuAEfXb8
	df3ISw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8kxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 15:34:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-789eb1bdd79so39314137.2
        for <phone-devel@vger.kernel.org>; Wed, 02 Sep 2026 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788363271; x=1788968071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=FCztkWi4iSBs9Cbps0bL+f46Y884BqBCv4WkdH0ee0JCW3cOTk8ipYiXerPsWizetV
         axmYOhQJFxXvVvCvkd8Qmcz5ZW1pleq0pTd6IqPbTAaCLLR/ZoRs9uaOHnFu5ir5uYKS
         9mTvGxfOxJDQuLxQG7k1vAzrqGvjrpOdG3xEzvFeKrGEMqV6Kfy4rUGzp+zLZfanxzzx
         qr8iN1QBweBHf1s4AGINaR1+c8rBaFOvXroq8rtmDF2j2wrGvisxGURJrlwQM9v0ckU5
         pQOKFdLZALggI1Fst9cIIlegAPkm0nERoly+VP7hCsC5yWU0KjAtKgBnYkytilFjv7fn
         zceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363271; x=1788968071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e5rc5ZqqqGIDuB8180+QRzd9U64c1Eil4t/TI37H60=;
        b=Nc+z82Da+d6DSbUa6cv9iZ9q6GamvHPUeNq6dlaPClrZRtaVfyDMq4U8qMr+3qcxci
         GJ1qbWYnZAwzkTNhtnx6Nc5Ur8sv4IYa3hFZeaBKs6gSQ+XA83fo6HCGu7K2h51VvnS4
         /rAGfWX0Y4hZxo6Uy7evMmg7upXkC/bDxokw0Xlvxn3/moYV3T99n0Xht0pulwTFIifZ
         Ezt95UahMLexIKwqalf6ELYXtgSLExUvYQhOOnvb5WjPrLtc2lsVbK9Sy41aBwHGj8n5
         VFlB006CCR9z7QoQ9Hqdd9WtUgJCrzpDLDvA5GTzErDPtpAaqxfYyAxLph6Y3MYKxvBT
         L9NQ==
X-Forwarded-Encrypted: i=1; AKwUvByZERcddjh4QJoCCJvcRwBl9DKVtcQFPXWgKJZEzlOvrkYfZUdDWqhCkHzkYpJPNMEceY5CYL9kHFG2DA==@vger.kernel.org
X-Gm-Message-State: AFuF++mZ5RNvUWjPOU/B0xwAyOR7Y2ZlIY96E9n+pWKeAabX7E+1wa+d
	whMeY6wAcdo+zscrPBnOVIQJ3DHuGE+C8ovDuM1f+XRWcI/jJ84d/7C72zI2HvMQj62yc6X/HDJ
	e7l5MWIo8hgdC9z7WffYjgPMRQ03ZVoFXYoI/9MKgSbrYO1ZA9eiVr/psvuDjMEJp7g==
X-Gm-Gg: AYBFou3O8UpS6ENWo0Koc+B2m3HxPHWkN13loTDm1JIMjx00pNjSnAXf/2X8lLvFi/A
	JD8pn+BTRjSXIQOyrbyaN5VJhz3sxzuXK/DPhWGAF6ymv3SMaIxYfDWTgAjnpoPi8QPoluMfs/H
	qgAPW6emV8ZWiDiT9gMztRAnbwE775uYVi+s4z0Gppg4uRN5YgCVD4WUCQ9DyyByed5XKLSjl8/
	uUTV8WTSsXenFp5jMp66ZkEHMFRvfrGCkTmvK9ncUEghXVnrTkmDA37ZSN2uzZs9X5lGIPzt7M7
	GYy7Y5Ob+q5Xcr2vyQduMKdlsHkD1L78hXx8SL7zj+sNSMfhTj9YXF0KH3ARAVYrjIVyLo3hUrv
	TGC8vqlCW1f7v8v9QpG3/aQ==
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928051e0c.0.1788363270884;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:5c5:b3c1:1fc3 with SMTP id 71dfb90a1353d-5c7d23a5f77mr928010e0c.0.1788363270357;
        Wed, 02 Sep 2026 08:34:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a35a5e887asm1147281fa.33.2026.09.02.08.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:34:29 -0700 (PDT)
Message-ID: <e1d809dd-0972-4ad3-9dba-0b7d573d9190@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:34:26 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260901-pixel3-camera-v8-0-99f159883348@ixit.cz>
 <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pixel3-camera-v8-1-99f159883348@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX6NDemEmL0Ypq
 aCPy55kyt7LHCSdGDT6igpH+R7NQO+y0Yll2g1wKCeQM6Cteb4ldkz8xjpwowJwDZZhbb7Esi+f
 n5U92rP4onCmI8OGw8S8KdHzo6fqIrsHoK0qdq7at7RgCqPfbnjy9zwQllytXj9+2wKp4ehawvg
 w1PBsgOSfik1YPFUQxGxeZ1uficbmJhLsAlUJdRfv8kdFtv/6trdTB8jKsjz1XMcTgrOysiX2YC
 PCfo1rUnoiCPz2NDxxqMW2rHFDHrK345JJOXz5D/MhEtzdr9IL4y5HgQOXVPajUpxOWvwL0Lhez
 P+XyYAd085qiVML3mQybS9ZxtKX2aPLl8Mxxe3ax7CFkVe0Yuz8z+qzA7HJJCyNOWQVv6WMgNII
 1E8yTscL9MfRGzg+0DdY2GH7k9gnw1wNo+9e+JJ1O46xYhPusiN0ts+/FXccebyj6MR2fyK29OV
 lVbE09xEiyktmgLcDkQ==
X-Proofpoint-ORIG-GUID: FsQgNRUt4W2HbF781lBIQ9XnlCn7ATST
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a984208 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: FsQgNRUt4W2HbF781lBIQ9XnlCn7ATST
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXx3u9fwOvqC5R
 EPh+JyYNU4QtcKV2aTElnfVDhRgBP5CPQGjuymX96eKlolzzs8qKbKlB3yOimQF7Yeg5OuTEO5P
 JSekBatkQ5t0m+3V0F5w5/mc10Rwt7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136

On 9/1/26 11:46 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
