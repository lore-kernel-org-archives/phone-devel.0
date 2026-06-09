Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4393E92A9
	for <phone-devel@vger.kernel.org>; Tue,  9 Jun 2026 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992546; cv=none; b=o67/nyl2Gztx58aCRzIyV+OHaDF5i7eBrkrrGVkCE24W8PGnNPlgQh5S+MD52dY0h7am0N31JpseJXEM9mClBsRdMwQZ1YmOzYZmZfMgENnGy/NZrYV2Vrm+z+B3a0ZpeZWOx+TyarlYyUl1JfpyEJMh+UGmqVTrTZ9dyHIGwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992546; c=relaxed/simple;
	bh=BWm3nGLKCi2joyFCAViC6bp/DeBV9iqZPiIn3YWtERc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwhGP30zyNXX7dRiRyEp1PfpilVcG0SdkPtyjfsyx0+8gdSMm8WCO4oAAIs/D7XfdQotB1a0C/1cSM20Z3EbkJ8RgbH7J1wu4OvkXsC1zTJxu/hL4GTuYHBKYsDZVEAcYkYSGOlsDpW1tlAsqiFFM5bylQuORBbrdmk8bkXYcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcFkZZMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXdaYjou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcFkZZMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXdaYjou"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rpdT1959173
	for <phone-devel@vger.kernel.org>; Tue, 9 Jun 2026 08:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=; b=LcFkZZMUpbH0wss1
	BE3WlRIrHY6M25HK8yshws4qycoj6hyESiMF/VxS+V+dJmjJU8+0wICB+AS7226g
	NJcSMc7e1VLwojs2aQ+P3tZq7awVuEyPLeC6469nmift2XPaG2FMfksYFvZV6wx+
	KInE0QC4W0fBV7lkMnWlBuMseHlVsIjaKaRwjKzXkmnkpPfCoc5vhMkq4oCMdAOd
	I7TlR3jJUWiF7WRNeU7PLh9WCg6wfVqDqF0WAEkzqpNKlvMG/ZitK9y2DI27YtjK
	iEw3D0SSWbxspu++dhmr+R0MUr7uu+V4J54gYKApijeRa1mfiLQo+67U9ka0I86R
	FnnuQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8f99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 08:09:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517bdeceb54so4546481cf.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992544; x=1781597344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=gXdaYjoua3QQpWaKBp/bhHo3hRt+bwK9hTGZW3BDYZOixqmzxuIDMEkJECpp9T48D3
         NsI1pxxA4AS/9IxmTgJrSCG4cFJXDmTbqRnKFQeNbtphOeyrv665Jv9CwtTtuM58xoTl
         blZymZZX3o/iR1rKLj1eKiBcmz7AT4s0RkJ8XvVTYYeayNdOI894zMJrpmhV87GsZCnj
         mAXPUVA6sNRyYAW+yoL/kQTV1cKVu3rvLfD7n85B2ZwKC7ZU4ZynC8s8Q1nXfnGFUhlt
         MmoQsxOk9qzXz6Z3dU2DS6Dm4wsmu6XikBTNZ5O0HquI+2tQ4dWbij9BnfyVi1xBBvNI
         ML6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992544; x=1781597344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4XPd+wWpZM1fJpNrLe4aOekbkivtV75BjWBDetnKBc=;
        b=i9QzniSwuox0r7q3/FvCWAp2+u+ozguBKyn1jZNvHbZwl7Ajm2aLBT+hLbuHVsmjrU
         m0JPIX98Gdkp2A3RWSYnYMG2TOwhzE9LbAHw7c5Ev2WbZklvdJPyFESWRFiTdEcXB116
         qj/vXS4GSOXsgTf/Nlpl7YW8/IrZqYRFD/9o7YFIozo3u6J4EsxOBk7W+vHdI2dpLqWv
         q/MOubasnoURE41uOqvoCGWm5fy8bO0uQJkmjyfRdqfm1xqfFphxdNHuGmCdADBNTYs7
         6DkmBn1E0QriZGZkJacS0jJb6HqUisBQLOxWaiKvscVaYEd1B++XyK9H19nds0bP4gH+
         gz6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9p5MP2PK3goyULEVTQACmm7oC23pWmVMMcXpIfbQmHT9s6Yu0JNbXOyRP/hgnbzN0oMrRyrC8g9V8cQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrfdYxesZ52yfPn3dF1QpT0LL6m72ZQOYkkDe5JX9wL5tXS0el
	c8O2D2s+ctr3zvUBuK3XAkwHQVBxX9w6w9oSRfgUWEELSqzVVpMJCNUCW88gDSBNyighd7HcaM6
	4/c5yfpkbM9VAtJWsA2DiZFEcrUnJdNZ3HL+7NKE0cXts1KMyhJvESDhA/GL3Z+Vz3g==
X-Gm-Gg: Acq92OFbLJMKYwZiCfSRVjHtcsAKj1yTI+1Kcb8i9/u4vJqkVhrpwnuHVFAjsgfcbqS
	jTJnZHGmJyFKwI0X+dINzccERnv/B2pFq9tyyZPiLDHCqUmEqS1gZgFIxlRbXqz79E/mlN8lyP6
	NU2xPkqN/lhZ3zGaK/J1nqGy2FKQFRFRQjz+So9vjWEU2qgbQzm4HJZG4C+ffs5EfaSNGEM5H10
	KLyAtRD8hwq13zqpJ8LE0VT4FjLZpu6Ze5y0vyRkZUxnglzfB85CT4+hERowos5sK2tUqxlHdby
	XBtj4Lt9Ex+628YkFOBLPN6nCSK+dbUWM2JGUxbth/YnvysAtkZnajiKw8nrxxFJ48S1gtiZptX
	otmyXyqtKH4wKNyF7N71CZXYbqX5Uyun5d6CsNjXn19Iyz5LLGrM9grcC
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14829061cf.6.1780992544047;
        Tue, 09 Jun 2026 01:09:04 -0700 (PDT)
X-Received: by 2002:ac8:7f91:0:b0:517:57c1:bbdc with SMTP id d75a77b69052e-517ca43b7dcmr14828921cf.6.1780992543502;
        Tue, 09 Jun 2026 01:09:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm978297966b.45.2026.06.09.01.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:09:02 -0700 (PDT)
Message-ID: <aca330b3-3fb4-403e-b30c-5e3a612eeb1b@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:09:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2sShhfxKrSUwMwjNOWSGdSN0L9Z5KFx-
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27ca20 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ubw6xtKFYLytkWTF8eAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2sShhfxKrSUwMwjNOWSGdSN0L9Z5KFx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NiBTYWx0ZWRfXynxuAa94BqSx
 kmO+iSDMJFwY8nrmMmAQ95H5XXB5OpX0nvXcY7HMwRh1Rx65MMiSdJWJtKq82wuxImEnGdzaehN
 hfLtXS3hfsciQg5Op2owqHtTop/il/q0mHLFT63OpQI11uFZiI4QJmNGoKGXH/Ug/Rj5SDBDvO4
 8TDe1orAB/z8knSvNPCvrSScstkyj6A6HAqI5X7ZqIvyygLzapl36KXgosFxa7OZ0qabj+XihmQ
 d2nXeMhb3g1itCcWiBJFIg1CqmCNm6W7lgdEIhHdoGUprtOHzYTC/X/Yoo4LPD1w3Eb+mzVX8rm
 j9SIvyXlOMHvXal5Pw9IvtvGYtJNwDwCwMz/0rR3jk6aZSjJDYj/3uHCOddi00VN/sREypAoA0Q
 Anej6csNvPGjPKFxlUMARhekr539+qKvPrwRnfcoTrOGLaSfxt4kbV7uoBjvYy6H1HWBkpyx80f
 BCDuHlHqKfeubyxo1Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090076

On 6/8/26 10:10 PM, Yedaya Katsman wrote:
> The change to the panel compatible was missed, fix it. This compatible is
> already in the driver.
> 
> Fixes: 493cb869874c ("arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel")
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
