Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BE43C196F
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916953; cv=none; b=VZJRYgCA9QrcAvPgJFdg0aFqazBlMvAKOjMPmEcIiTd+wTvSFQagq8PsVjQkSwufAB6VqyNBYqoc5F22pzOSImFVMcIfDGWSuDLaF7TN6qHLPcL8hQ4/4xIuQrmYCC1oEK6yM2G599TRB0I07m9aHjUAGRQby/PqvEYntsSuZDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916953; c=relaxed/simple;
	bh=9jBSf/uNRdw+jksEzFlUk/pU9SX+4YEraC7iWV0w5xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIJISC0KG0OKEibbdEKHb9bRmqn8CWJNptKVQI75sr4AUAkqYQUXxgEsviaxE/bCq6kTdE27nZMQRdmItD9AykPXzDi222JBQrwkcyF/gt1OQYt3APmSSfX9rDFZQoAhTfcPF0Bmz4kEqBy7xpMQWc2ms2xxfjyY+2NHb3HqvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVYmaXqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLXyOfW4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVYmaXqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLXyOfW4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wUt3771122
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=; b=MVYmaXqE+tZSlfgC
	/oQnNfAAdrsYvw04K0yLF4TxdGsBz5jlVwG6ZMIs+OxBBlqoBSKVhMwW/bwAHMfm
	dlmfogtfu8/B2E0rXiLd35RsyvjYJnif0KXuHvwwxKP9C4Keo/L6h98SiNkxc16U
	UgG/wdU5AsHjKO+uvHvh05+CXEAXKbjR96fCn5OyzL99Mut52CEv6a42xH8bUxc+
	wAAdQhLYp22Myv0LU7InAkanwHsH2gSPoSnBJOkAUBZlxwyTSRPM3k97LZRp9J6p
	BzmhjMXcBJyPVqYjed5tULZlfE8JQKaxHXmkVQMvy4qwjICT/zb9+gDGMKysAJbt
	I/vt2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9dw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:42:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c69c8dc7bso6821546d6.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773916950; x=1774521750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=;
        b=gLXyOfW41LYQ9C+jSF5ffTeEFleCTaWKK32UhNQ9JLLsFtphJHgm4TdaqyKMAZUO1U
         91W+kKY/KwW3Jx93urrExEn4UCk5Q4bVY8sE4IfIyb8ygfKZ+EXAf4ae0+9H4BglRE9A
         BDfVyYRedI9UT7ow2ICCau6Gh4NUVPjMp0bFSOA5nx02Ie2nrTHyOutEUYq7mjTpOmil
         pP9UTbRQMZXL/KvTc+iRSXKSF+78/qJQr+P095uGthJAFb8sXi8m6xAepgbOlntQNNFN
         CqwXL/ffEQGi5ggvcY4ZdP0+GS8C7FdCxVCAr4GepEsS2kjzMBojzo2DMelvJbNlQZBz
         8TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916950; x=1774521750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6Ckq6EbrjkZQ8EXCi0UoQh+NfXwqejA2If5XX47JQQ=;
        b=YVJFpXJ/1x1exPkQtO+PggssBueDNMBZPJEV31yTCrFHQujxhqdA8A7Ue7pV6HTB0D
         dohQxgrxePZPZ6hBbCqonfKfPjVB83KoGiV+TBI0IZxxhxqHuBaa7/vl2aQX2MqddUFY
         wL5ULCRUg2OSe5+liaJDhOjo0Mg91Q8TvcAsBGxeGocv2aaiPtgE9D0QUb616sUC8A9y
         9rC8XHt3jsm0MFuHe+WsDh2nNtaG4+lYlANbgbdTax/o1lAMWOhIxRWAEt3o1JxdlckD
         HzBlM07qw/wZ9BZRmEX6t0TLOmELH5I9IpEdoUscraDkM0i13W5BowSmtoYP3/5sXSLX
         8YUg==
X-Forwarded-Encrypted: i=1; AJvYcCXGq06sZu6Ll2JhTlaDd6dRSTt8tp/oHDhEfU6Bga7dzdGXNcVs8TOHUC9RseWtLr2tub21ewVlHOz9mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzctJpxDVZX0gHQoY5gwPfBwQUH8Ib2xoMgU+G3VbGYWNDTBX/i
	YWGejPhOocdQsdIWWMOgd2YYQ8i+3p35bBc4K/YbJcR2ISpKj36BK0+L3+bLOfKMLh3DFEuvsOb
	oeD0hVB2Oj+cJGawkch6+LnZIOh52qLLPHIMVA3CDMtxMk3xyB6KoBs2f6VTprZalBQ==
X-Gm-Gg: ATEYQzymx2wN0qM1ELYONgZgU6j4Fj+1FniTdE0ruv4dIiMnq9GYjXFDPXKBrMXXliC
	g1XpuXl8CnQdDOeFWIzAifYc4/yK4Gs3KQzEyumiJC+Xz2DD5dApV1wpOwjoCxKSGxFUOAf9FzP
	ZdkT6NFM/ULpbSnx02yMekbl00dWUtarZnnl2sZW8xZg64vzjnedAWNxg3uk/eLK0Z90wxVB6kb
	tuhBJ9fuy6dGyaeLbJc9u0aBUhygbL7WzB8b8iK+RPibquva4Bdk2VM6yi3vh721CPEVNz09tV7
	ZbRVSaxd8M1cTLSoaaQTD5vvRVg1mhf42usVOkuWyUFoFOoCVfDIGb4rY1i/sn5pVg9Tath8fwQ
	JufepLCa1nvl+btMWD0N5+2FZM9uzP9Ysa7+k0M5enXqUxNE1zTTMxPCgqoQOReKyxkaia5rcgy
	i7g1M=
X-Received: by 2002:ad4:5bea:0:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c6b4beb0emr79650386d6.2.1773916950056;
        Thu, 19 Mar 2026 03:42:30 -0700 (PDT)
X-Received: by 2002:ad4:5bea:0:b0:89c:534b:735b with SMTP id 6a1803df08f44-89c6b4beb0emr79650046d6.2.1773916949616;
        Thu, 19 Mar 2026 03:42:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1686b7csm427117866b.31.2026.03.19.03.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:42:28 -0700 (PDT)
Message-ID: <c9056612-8944-4bd7-863d-7632be0ed79d@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:42:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-5-c1bf8917449e@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-rimob-new-features-v2-5-c1bf8917449e@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WsnJ_QB4jxGCQziQ6PAFO8cOc473TCDr
X-Proofpoint-ORIG-GUID: WsnJ_QB4jxGCQziQ6PAFO8cOc473TCDr
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbd317 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=FcDylz7_6oNKbyFHn_0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NSBTYWx0ZWRfX9oGD1KhWWd3J
 XKB6BPKFRaRoVeJNethO5e5IAQkiapTZQCh+vDt/VZXBNooneym86p5xO+vDRnjzPSCbALunliU
 f26TB8FZ3dEaAvvMDFlPOVF08Bchmtys24TgVV5/+tUYOlZWgmI72rQKlgAR9IL8wPmg/QY1S27
 qaWXomrsePeuoYN/bPQkpPvDwUN40yhDvj7nDkxF+bX8y1GYBKaQ6Ux78MOf0Yd0IWhAtDSKx3g
 pXfJ8Wc7ZK+7+LoBBEfKifO/A1WhIhPsNkNmMHjVZPC6i2LiZwEGx5wU6C9PF7EVCstfTvnJlTx
 +UlJEx20W48BFAtcmu0K1OVTvzKCqCDDZl98PnaZX8BxhlM83gyel+GAtQMaV2df+QrXIIhmkxk
 rAXZ6Pb5LTOgmok06QPyEjBK3z2Vw5AP+ELNVg5KO1jnEN0lVLw8ZUrJDamtBmFxfdEkykmO/z7
 ckAGKfyt120lkfR6kbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190085

On 3/18/26 11:28 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
