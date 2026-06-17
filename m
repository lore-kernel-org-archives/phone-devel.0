Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E6927E05F
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698370; cv=none; b=QauE3YIWLUub9YwGZHvYg4T+PzzQDGtCObuByDJoI2sd01b8Jk82Q77fXt3xHxPnxwXq0pasDh0qwNls3xTu5c6wBT7i7Iq8qPnmTJVCK2EL6o5vecjqcEJ7q/G1cGZM6o0WsbE0OtA+TbQi10goblydkZKn7sbqmKaOgXs5b0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698370; c=relaxed/simple;
	bh=0bBGl8veb/tP96Tez8lUYsFTbml7IYTdlypgvfJVzWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt6ZUo0kbh9uigh7JRE8otuwsBj4wL9Z9to0txZGSFkmunYH+ff9a4ux10Py0Mrijh6MQJPi7Oz+wIKSDQfmF4dl1zAK4/DeArT0yqiK6IBGeYWjZdge81WqgUQV7hfiNxLo+GNNGtUSCEcdWY8Y0/OBA/hJ5tarxD9IVD/LhQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5fk6zOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RstQnuR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5fk6zOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RstQnuR+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V7GM2291377
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=; b=k5fk6zOurvf2PaNt
	eQVOPo78fhgQrzRrP23NZ1CzWWw4DYeljgbdrl7QJuInWpSlw12AZErCUAFrgscj
	dhgW8CGaJUk/Ibo6ldjXfjQMOLkDq7H1B2wf9gmF66nYpwHsaWJhgWvEwA+9ucTO
	M5+TkW1sz7Nr7M+cB3AB9yIwViXnSX5BxSxCxub6I/M3bsHmebLb00HYVB3M0OV4
	lK3E6+ZMoxPhyVWKodhsqT1BAX8RfJqxQ6t144BwoHfgE+jmwy81zhGoybuTPkYY
	r3b/kJF2UR29gLzML4DXWRgiqwLp1gLMA4jGyoKBPeBYdc8BOTL6ADAz9J2rBA+e
	8E01aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevk3f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 12:12:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so13430181cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698368; x=1782303168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=RstQnuR+oARFcc1c/ueelLaybObBlZg6SyrZxff6EKc5HT4XqFREn0RRrCbLkP9G09
         HFu0wwYbwcw5WmjIuV/r9I9I1KspoK20VGVGerMzcFMyFCaeWf1g6QSdiduW9YbtbRu5
         yndMQYbARNDtK9DX4jrO/zQKoU0+qqxFSXq+1MWuc5bh6IR3xU3OFe+PS2wzi+PXu3xg
         ahgdfRkPYT8tUG0s5fy6xApm8cEXqUnGSZc1yqMXUAhOW7x/XicGhfGPvAy9aI4iXree
         e5Mds/BBGav8lwJ3DkX2fkCDQ5NqIQZyTqfXSjq0wSW1fSea6Do+HVlPWBbdIYKFR8Du
         Pm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698368; x=1782303168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BM7xOnT7k39jKKMfHpXEUbFH/ygimJf7hwotvg5lHcU=;
        b=M+6mL+HTu+ozajtQMM7vnB3b1qd4mYx0JkxWnn4+0Ed1iiJW5t7LWphP1pwtXSkT+P
         50JE43yf79z4sVtSphB+5JLTsJP+hSYnnu/IIOjZVAjuZ2WUIFNw2o9YqJRo9hZ22Xff
         auw2BTKIR1TqkkgavxeYipnqE3IWRLJXw7Ij7p6SRTHSl/vqHF7qBJ198Sb03Zcs3QZ7
         zzSgt+LQZsNDkawiduw7qmXq4bi6JHmpoNe9O9dcG+E3u6pG8nc7EsQN6YAVa82r0E3l
         yxDUf4RKsSiKgHFHSuPIUTH26Kvn+mcJn/ZXac20i9I9oLM/qwnQogDLtg22MJjBJFFX
         E40g==
X-Forwarded-Encrypted: i=1; AFNElJ/fyvdgblCKLRGDfIkYTdNGp36dy1PdVLEjQakGnK6Hz155gjxr8VfoJevFFshTPODw0X0/t+MYX1dSFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRXQGYOG9pXIC7f53woArim5DZRSFi16RicqpikFKIDgnW/eV
	NhTt4QaM5fo574u0J3n+WiISZzm3IuOnWpfqh1LW8UG5teA2UPiWj/7boruSjZL6qb5ooPd/DKo
	opASeGL+EcHTyRX5F0oekFBNSkEdzMWApPf/MRr+rh+Cn08U4D55TUlA7WozywriMHw==
X-Gm-Gg: Acq92OGrlN5IDO/URpEq5g3+bniJZvXEtAyPZ9Oc+PkouSYP3pvxhzdxbO6ZeI7Y03W
	thsGm29ij507Wf3KU/Nc7SsVEfnejAc9tiZAmdVXbGCDFd1IQ04yBinmjmOUvAX28JqBMpFztsh
	xn9BJAplaLOchB6GibhndPDJDWkh80tNaglUKnOiFUVPvM/KEAXMbNvU7i49rFgu7oTwI34P9cm
	kzm6Vu68j+Y9037atYmzMBp4gzcQdTth/MFfTs2oPAlctMaWGtxFI5wetGCqH4l4v6wRXlyc0SM
	vSEFvMv8tPbMsru40ZuQ+KrA+eVrozgiUmGITy40JQk7olIjtJkvnZFbL7i3T7b5C0Xzo7jQDwx
	bsbETRpK28E9IFztk8+wUjgUavJCYTK6Kz5U=
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27927371cf.0.1781698368184;
        Wed, 17 Jun 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:519:51a9:ff67 with SMTP id d75a77b69052e-519abb5394cmr27926871cf.0.1781698367625;
        Wed, 17 Jun 2026 05:12:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dff8sm6308440a12.22.2026.06.17.05.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:12:46 -0700 (PDT)
Message-ID: <af46a084-0544-49ec-a75c-70eac0d0ea49@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:12:42 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
To: Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
 <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfXy55IwIyX12cO
 kc2Bh+6IuL2DUD+x//NTlxcLgoRatdJNptCuFpVnKeiSBvsq8XRS+HPjVf+E1iSooaGrlnocp0r
 4kbwg3ZdM4IUa0Ju7WyTgxcChcpTk+Zle3zIslEbJzEmtRUwanfoSU+xb/rcrKZrJ3YgRhOVdmd
 qBtc9qdNtiqUFPUKCm/12I4RAOeiY6uJv7z2wtFeyWutTYs6rXE5LXZ+rvv0JxMD84Aky6NVlkH
 bpfF1GdnxT092+yPHDPDHV+ULt5MRF7ZffL6wTn/K87DEvJgYVdVN59NjFsIWqdqwTV2EIgKZSf
 86vtWUd7xnh2Z6dkaYBLC4zdkhZjUoUiMJk2VO4dh/4QJNIb/gAVb2idm/zKuDCFFI+6gqsNKwy
 RUjKQ05a1i7Ul2rxj/0fsBEbtqpIIgCsVG+GQF4TZZ2mqG5JbwF91UijHv45MmA2ebvlZ0vT71+
 mVjto9J9D4X6d++3nLA==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a328f40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=t_WoDEAhxH4J7FjSGWwA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: N7Wm5ClNrYlcMTOQ0ZjgmJqFnUFxcSK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX1QCj3VimukPZ
 H5AVr/hslEwn1U5fSe0fj8HKgI6g292qf2GMHGKHX8LU0GqscymW5JL4WTVAsb5uEhYJFzWpZRT
 ZcfnrFlELQT+our0VzYzR+DNkaHMhP8=
X-Proofpoint-ORIG-GUID: N7Wm5ClNrYlcMTOQ0ZjgmJqFnUFxcSK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170115

On 5/1/26 3:52 PM, Luca Weiss wrote:
> Configure the MDSS nodes for the phone and add the panel node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
