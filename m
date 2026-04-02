Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1938F62E
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119825; cv=none; b=LrEMkfaatlo6UR4BblTW+IsJie3roncryvw/GdyjZ2rNm5gaxA+LNN4p744Dwik+OY6ZnEodtUS/25CsMRHyGXITXnNy1gd57q6GOfGDkfI7mDhpn2KSI/wb6RO63z/cxYYaMPkZu3TUnNq1fvbADhmzTlf/l2NZKdT0KzaWB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119825; c=relaxed/simple;
	bh=nT3uv/bM3p4U7Cc5AFOq99C/s5Fm/zMmpDSpH9xpC8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX0iRS6vMI4mMu+czua3D8IPOpmZIJpJ6bVmNq5sJ9HF/HMY205Bge1FcPNAXOpNQtZZujSKUX2jnO7uVvqJIt//BU3sELTAZ6btH+vu+/pipFg3GbGANAj97KcL4QKycynLN67DiQuh0+NU3USCXJv/3kKXO+1a2EavaxYbFYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBfuHd7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsYKRZCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBfuHd7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YsYKRZCl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326ltkJ3955878
	for <phone-devel@vger.kernel.org>; Thu, 2 Apr 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=; b=IBfuHd7Qy3ZpClMx
	Bdr2GrGoxnMnk8lHFc48N+XohkHsxAJjoWc1jIflnSGkIBtcqH7lEqpo2390r5lv
	kPrLz+yaPYTtzeXjqxc8iknh3AcikGS2GKvfSHR8NsBhUUF1wYrGcifda24VLTVU
	7Gjxlghj2O3ukgVuHfHwRItIVQZdNqI5baktLHbjuARLKLEM7Yhpu8xal/cG2Tq5
	hlS2BQDJtIBOsAS10mBe6jz8Q/vZHZvM9YujmDPsxgUsAujJXSPk9pcJ691bWD6c
	Tfl0MbafgEo+mRIpADL9ED4ZfzgnsMWYFq0k443PuoshX7LAnjcQ9KH1WGj+Q0LR
	Myl8hA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5j9f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 08:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cff2297253so18509785a.2
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775119822; x=1775724622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=YsYKRZClHgfZ447zqIf1M5NXVNtq8qKY7YvRUYd7aJk7v8wNupolAUEW6dYhuoy6a3
         Y284uGUWZs8TCQZ4K62hCzdMm386T3ZwnuiQOFtgASW34zv5UoV/C/ba2NqQLaIugHMH
         hscFvkWxX/YyW126ahoRiEsFKgdmdINUORjO8clrPS8fDucfHSZRdfcLUbvf1qwbHk9/
         ywEXGAfmVD+QPGvgngsZTx6TcB2xTIm5/AI95ZvFnPUsSA1mWuISV8dBw+A+0BGsm6em
         /qUzoTjcFaTgvQmwJRvrGzuY//wn1dx8l0fPujPyhy+SZ9PrO4rZkewdjnwObpCS8WLE
         6jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119822; x=1775724622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOEmyCA6mMKdAVKcBD2Tg4Vqr0s6X3W/aysi1+SPwzE=;
        b=kvN9jSm5BVOOx3sm9qNzr/QSGM5u4PXwfgUGZoWgdYtQkeU+WFktlntUqGJuIGWle/
         66ZJlTimkLY4JJ6eAQB3XfLV7hYxL9oQJX/UkMzvZq2Ro4ZCLFY/MGgm3MlEF0WGhkqb
         yr4gdP8qsaSlzEwCclaZqmL9P0dUI2JXw6Bqx0rwf5BTJ9mTIf0lRZCM6+NW2OeSAQAp
         sBvc5f9+/jmOvOaXyYqCcGgd/E5Y43V0Gg/r9F6XV8S/HMuzPsMRNc5szTAk36xySzmB
         w6/0D4VpVk/LKutY4X/O0JL4CY2iGHIw7EKRRP+TCaB2Sk+KF0rONUd0kcJ4KhIKVrCd
         0tnA==
X-Forwarded-Encrypted: i=1; AJvYcCV9dktV9LgrkDWuUxW6aoyB3NZdlkC/QQGrYwDyFJT4irc94cgK09+3gUIa6T5ZwfT1Hh4UkLkMB65POg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMznzN3ltUu9uDedNH2Wz+raO/oMaZ6LRBjEpL2ai8P053jLx6
	4nqyVlskyp8kxPaE0RVG3R+dL45hmihmZ9DfgJzQG4283+dZ/5BMhccQ12ZPujXyFE22u4uJMIt
	89wORt6VI96ud+U9iy8hFsEOc80QJtrcldlFWuP33egUZVtxWhwuwwpeZeKFqSsE1gg==
X-Gm-Gg: ATEYQzyOAyVW0o5pmY9MaJDAyy2K95x7YsfHhidO53rBHMZPDicrXNFT2yj1pdwXFOM
	Dtgt6gcV+9LsarsUgS+e5d75CVtnrfCANg32qwK3NdTV7HcI0Eb4bjq4N6XWDydYqzRe01Msb3l
	JipGEbJswWsEewGzqa5kIVQ3ahX1IUUDONxDiHC+k/M6LbfRD7t7EmHB6iEOo3L5Le/ricq2zv0
	mcZdVOmxAy5inCXAJ1Dyd9fRnEoWsGrUVlFbCQR2nEv6PWqU0Z9K/O6nbYAvJLbFi4Xcde2sJ2n
	GLH0BMsZaLObEWZoh354DIUHEz8gr0Rg0zUQ0IMsbR36QBWSVyoy+F9FIzRE5DdXLYXPF9oqvOG
	+XB6KRplVBCUDcHYvjXdGxzQ8MUBFmbisxlSKesQ4EwknRGYetksK1L4x43B2rBAxiSe3fT/k6L
	sM9bo=
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732119785a.7.1775119822043;
        Thu, 02 Apr 2026 01:50:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d1b5c43b3amr732117885a.7.1775119821615;
        Thu, 02 Apr 2026 01:50:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fd4sm526816a12.8.2026.04.02.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:50:20 -0700 (PDT)
Message-ID: <734db4f3-3db8-48b4-b630-5efd0069a2cc@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:50:18 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
 <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce2dce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: Tu8hVSboMGEjfCEIQTfpTLZuYJH7ZLcW
X-Proofpoint-ORIG-GUID: Tu8hVSboMGEjfCEIQTfpTLZuYJH7ZLcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OCBTYWx0ZWRfX4E1poT7xJMLo
 OVgVvHp08rz9n1Ws65lC42FHPkv1wr4ppuOuwfQqyVoYRAW4giCm5M1hUg2BwivabPza8qdxF1Z
 5LloAgTQribTLvvIZotqsV9dvamW4WTWuB2pnbE+Bk+FxPuEyu5WJCEEeZJXJ93sVaULfw8kXL0
 9qzB7L+WqtD30RV229TCft//vsqju6lykNeMAsXHWDriMBdCobmxvu/QcGUcsCn7fb3ZBNYqLjF
 gMirzzg+PJLqIyjegbAj5/LnmEHgIsYSrUoZ/D8ovXhevK9ugJ9J7hdSaUA3nlfQ36Ca0x8uk34
 OO9cx0Ovq6asqoHUmpf62wUxLika7mArhapVEoMFt0/FrHUOg88X8qe+oCSD51DQD3rAuJoYN+d
 +EvqvWL7WoqWKln2ItfeXqIJJbFKmexPpfKcMGAC2Cp3Xd9r68CYFA5sAxbIO4JIludtMtOTwhl
 W4YJ+Okhp+oDyS6hg4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020078

On 4/2/26 12:39 AM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

