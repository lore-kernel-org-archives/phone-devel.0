Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0C3876B0
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259827; cv=none; b=VDQUcPASjuGdeogevDVqnavX5B/by8+Zmx5ocOwMRspx/7jWvwEZLmBApHh9EsgrVqfhFyVbs6vtMvRF5NTaflbnpfdJMRbQx70LB04bGeIBRT6l0ZZGfDSOzaW2OuK8DsHWsgOZLYBP+ZXaD542VjRV7HJuUeIaamutCzIJcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259827; c=relaxed/simple;
	bh=l6SUlmw72Z1obSDidpLnagoC23CRG26xGqAcaYvT+Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaDmtHloHgligZ4SRmo2mUw14PdDTi84//qNy5+SzznhXzRL96RQHwj83rfuUcDfv/Lbish7gGFD1kISsp9WrWfNQtCdjRBgIfqffkVMgSl3Rwd83Fm03Bk0gvA3qnQJSB8iZCumDvJijGG3h29Ylo6EIBkBQd35OXcKVGy9QEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxzKNDzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYXgK23y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxzKNDzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYXgK23y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4kPde3090776
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=; b=mxzKNDzhvCQ4cOMH
	c3bg/xSB6XHnYlrqgFJZx5Qf74Df2qeN5Q3iGufWYs+gtg3QECnFAzmFEKOvR7Rn
	z1YJN4l90zxPDQ4y+LqYn1O1vUpfIiIdQJX3nbQMrCZMy5mEUQKTsLmbdVk4luXz
	34HOSjGW5gAOikjERDkGz1ENJ7y5TArxhr0DSQLvyDq+iZV+xi1Tozm8av50D3cK
	PR+jMCrnPySvBdeeayCHsVphFFvxMy6mKUgq+HJge/qOtDC/6ILiBqpG/n1x0D4T
	MbmzZ0mKlKMR9CzHlYgZlK8p1CzXMFZrFyQP8+5mpexjB3iAZhQefn9IWG66Mlx0
	oAVtzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvmuun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:57:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2a1f123fso28015501cf.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259824; x=1774864624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=LYXgK23ygBaQmoKorNJt4MUmp4LgAiae1D28ypK/hH9nS+2DQO2RpPqMSCF2dtPhis
         UYGUmp4QxZPBUHaMyuC/rjwz1WGKpgwEaxyDsJi8g22ho8yOQr3bbBl9c2S/W6b4Qrxp
         x97EMPWCAUUYXkHUeO2sTgNd3txTfNomiD/BEy7ZR071uLEU9DSDe8YW/Aafl19cnVVs
         NRuIqrzzCkJiS3bpxw7lNwGT6zVfobwUNGnn1E5twQPaH7mP11GH8G1c5P1OoOzQ41uV
         ueJtX3W+sGNBV3F6F5bv5zKP5LSV3Xn7cJg6u9MZyYpRiPI7mmQTwK1UCphGIamEzY94
         RLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259824; x=1774864624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrC4vVVrhYh7aqBcE0JH7rg4dBO3PuDHSwvk13AfB6k=;
        b=aS2329a6dHu3okidOKYNCHYIBHPYo4bME6sSixkg49N6E9s3Em+uozX16fDjaOK6d9
         az7Tup4atOZq+hx6SNkl5BlHy1wuVGibmI6d0MUic/mxfawhleSu53qf97JW/xu9ARm1
         YIzcWnhUEi9Mrm8K43bU9euNIMlwpnuRptVcDmIfsniUQAlOHbzwLS01uNDt/J1w9bO/
         Ov+La+7a+EkuFxVQysqqeghlD223ZvYjkXjgLAaB6CCeKuKxbdnKgP5sXoU+mBclOYow
         Ivp6Moa0Hna8peQH0h/ID8FzLPthkrnVPB6iZlI2s89R6b2uOZcRDplC2QmGuV7D/iuX
         TU/g==
X-Forwarded-Encrypted: i=1; AJvYcCVenxbEFl7jzZUpjKMioZPYXCGXCrJaCegRndcQpfDD2wlXDEVfYe8E4iSC/U/x80Jn8G3OkPIj9BD5Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAkCtPyPuqyAl7YOfzd00QBKWHY9uoci+nrXH75/HoBfiH/lF
	Mwv5TrayRdCB/vtcgM1+WoJ9ovq1sSx83sSqbJMnNDvRbn+hM4IKTj9nq8Y8+QsoV6f9QAN1taL
	/oHQNwXmPOyvmIvAnmyoa0fz6JoqXxjfD4tdWxzdKObLa9OtIJLa0H9xnoVtuPF35ciKGW5lz5w
	==
X-Gm-Gg: ATEYQzyV7/0dATZ4w6nDzTCnRjiZ7szRgHF4s2nIDNBCeeds2XJpwYvfnMUVQK8+Z7K
	frjaJcTTkiLG8Z7o+Tdj4BD9nS6gY3WCCuQefrWz/yzXausF3GnfCNPWJbUj0YPUpW4Ntnsam2j
	fozQk8aR/2zQ3zpg3teNLs6XEdM7jfreY96jT072atA8fCU2L72mod4F8fmh3DOK2jFWp0r/vG2
	7y/ZYV6ZQj2ID7yqHL5EkJ+LuPQJ+NR2YQ0SpEbeqhe1WcoP/X92y+kXq/iCbZ/DbawGU0a/+aM
	yulTbkNKsdNrFgGvFVvzLE4uwQI0KU6dTrYhcNT3cFGPxEUCmvsyKUU9xiXKceITmsCmtrNo0Ns
	i/YvBK6G7FoEuh1rtXV1Bo+GhNuRokc0DzCSp4+uXl0mqUt+ycgn45iDuepw/4H0Ry81AD9SYc3
	VUQmE=
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144313111cf.0.1774259824216;
        Mon, 23 Mar 2026 02:57:04 -0700 (PDT)
X-Received: by 2002:ac8:5a8a:0:b0:509:39b5:a97a with SMTP id d75a77b69052e-50b37270a84mr144312841cf.0.1774259823738;
        Mon, 23 Mar 2026 02:57:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm477970566b.4.2026.03.23.02.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:57:02 -0700 (PDT)
Message-ID: <8c79a273-8ee1-41af-83a9-af963081263a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:57:00 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a
 regulator as powered during boot
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Joel Selvaraj <foss@joelselvaraj.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-beryllium-booton-v2-1-931d1be21eae@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX4UYQ32kmqikr
 oRlQLUAFEC+qac5B2dwqAZoWjSz1cGMIOt4X0eRSJJLobqFeLz2C8h8d5PENUUv8OluSXPDoNsS
 l/S+rulPdWgAKUX/BMQj1G3r1nNNprT+nimPpH8bqbgAz8RyycZ6C4DFBKb+F9QSOzlwnHjC+S0
 JjMuvuaiVzMmQ8VIwVVQowTPoMz4brz9HN+BlOo88Exu+xlS7H4f+I8gAoIPOYz7/evYknfgUds
 ECX0Wgm3OskI6BIKyUDfvZ0fvalVEDbKLcX9OPqzNlyhNMpKMVZrkjFkXiYDFwrqJIH/2zBmN/C
 OphKGjsIPKgue3xvLHKZx2D3ivrHrPVhpovKX9kYpRENyhz+D/Zh0f4Ff+nRcoxPZ9aBoN8JFn2
 F99YRA4Pjt6EVF76hdjyK6CPJmgrMWb3oT63Nr6xe6UB1N/T1fJ9tUjev3lIdUb4cChKJIkM5Uq
 C2Um7nu6r7H4tqLJtAw==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c10e70 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i5pV3rSXluZByS3FN8IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: sIjgriUXix23nLJwqO92ubP2Knn1HR1k
X-Proofpoint-GUID: sIjgriUXix23nLJwqO92ubP2Knn1HR1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 6:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The regulator must be on, since it provides the display subsystem and
> therefore the bootloader had turned it on before Linux booted.
> 
> Fixes: 77809cf74a8c ("arm64: dts: qcom: Add support for Xiaomi Poco F1 (Beryllium)")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
