Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6EF12B63
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741990116; cv=none; b=e+BrpFoa91d4NQA4eXkMlMkiEhl7MXd/L5PlZouCRfPtt9CZPaPYrnGeXq6jvqo4bqBfZ73Vxg5nrGvOxFGO0WKNB9lf4z5eMRHsth0uPrmlWl3yOPHYyucKPfRGIh9EsNEZpV1aR0vaQgGhAKu3hmfUtwA552wDCbSD8nsy+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741990116; c=relaxed/simple;
	bh=gwxABmgYRskBGGcXdPSEOoUwGSoADu5LQaEr7bCwsdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUEWUCOpgPg54KBUAU2Ci/oAlloSQXAt9BwR4TebyqkWZyyo3Kp8/Ps1mudL2nKhrIuu9M6tLqFwhbZ5RgrMZmgvX4d8QeYEQB8K04FdWS+Y3ZXb2ewed6PeouZIFJ02GI1yHgFjyZEuDPtyUFl1FYv4O3SOUgKVu0L6PquYT90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mv7Sh3+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mv7Sh3+c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EC0bnT008924
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FuwgRurmVtMBmvvOLj3w9vZf+M7qrxQwJlt3f7s0ts8=; b=mv7Sh3+cP3okyvFF
	6jGVPI7t3fs3ihrZ4Zod6d19m30uBz0rySJGK7+DRnGUVhUOtlVPdI62NvDCKWNS
	KyB+AdnSpAH52PJZB4BGThuUB5vIAAjK+9hiM+TCadJXgpcvOa2qULDqeU5OF/Yx
	AuY+OXq7R6c0rjb7w7UvbOBV3mmUE1RYAxvQj5tiVBULMk0V492jKjrs/wDuhENi
	LWwzR1ISWEeqHZPAiLjiWph1WXXTnBOKepfktdf8kUyHvnagypu6ppH63tIYJYLJ
	V36vyGqmQq4JYTHqfBMDazfxjrVafjGUMDl3vGTBoxmcZVyJ3oALbzDN5uXyKZgz
	MPzKfA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rjp27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 22:08:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ead1d6fd54so6696896d6.2
        for <phone-devel@vger.kernel.org>; Fri, 14 Mar 2025 15:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741990113; x=1742594913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuwgRurmVtMBmvvOLj3w9vZf+M7qrxQwJlt3f7s0ts8=;
        b=ckVnkKteYVd64LNyh9nJm5o4E0N3Up+jpknSbe5yfjJiC7VDLLpf4FwtErc9dkHcvA
         iecu5nSZuE2glr4yq3LQLwNaRT9iWE0KUByGnEdsEHhj0aihlb4TOhWgKozwcaAYLsYg
         jh+GaEMRMUlmoJWgceoSh2uyPpCRGqGCNxU09l7mSybu0NYRW3NWEzoAJ0T+cXuEexKE
         icvdPYhh5CcoX/u4puP0V3N2MQ+pV/6K7cqWyrfSKkCT8ZIHYIPNhIBMG0JUc6XX3P48
         h6lLpjHJXffcuozsEhv5Jnu1AgWZ1x3A+994GRAHFk4GFn1eWaE2QuZIH8uw3O7X8ue3
         Nl7w==
X-Forwarded-Encrypted: i=1; AJvYcCWY6t+1Tzu9SJolNhUXaLQouR8Q61bL2FHLv6578RxjbMU8RTNVJ9aSNF8YOaWxhTlKa3pcjMUbvXpIUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7s1i9UvX7Esi7Iw/bgap57adfe4UrqJEgJfFQx2K4oZiDc93v
	KG+Jla+3H/H1OYqdDP8LObM2SuMfRl41jjqEv5cU8IP0BZ2DKaF+T4KrSd3kRgP+ElK3BpHG00b
	iU/vBG7mDIbLT2nnQSBXqy+3dBlQXRBUJ4G08dRb91veECAfeLHecFF6wAp7SeQ==
X-Gm-Gg: ASbGncsuZoCImRNT+xB5oIHp5cLxlq7cL9WsSBfey/SIDe++X4ImMmx0cZg/+AUyMe5
	7yjwdAnDYLfeObwX7eCEyDA/fUD0RRpC+E/qa7vD6VHxalZiFE7y4NCwrci92bk5ytdmDkhMBFI
	IDpSHgHYIiUZtg7maQpyeYT3taXw8aoet2oD/J+gbXGsjLRD8w9uA7Rgs3b2HDEXKbijGFW7tIm
	HzhLdgds+ZW4ds5qPolmA5Yrrwym7JUG4e6y5UVgCWEvICIKp6EHmgANjl4AAMuEQEB8DihXFSF
	Sr/EWm41/sHwkp7URI7JTZK30VgDe9kox3er8X4V1YVCcJfag1b/UR4GKLC1h19JP4pvcA==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6eaeaaa0ca1mr20751896d6.6.1741990113580;
        Fri, 14 Mar 2025 15:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTYLhW3z7EdnBjx1RVyRwxYNeiYQoV/z78yiw1kmfY/RA7Dx/0r1LzHNoKRCiQmy1kGLpZUw==
X-Received: by 2002:a05:6214:e8d:b0:6e6:5cad:5ce8 with SMTP id 6a1803df08f44-6eaeaaa0ca1mr20751746d6.6.1741990113232;
        Fri, 14 Mar 2025 15:08:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aea4csm279191066b.33.2025.03.14.15.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:08:32 -0700 (PDT)
Message-ID: <3fe50417-67b3-40e2-9f64-cb3b9d5363f8@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:08:31 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add interconnect support to
 UFS
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-3-3600362cc52c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d4a8e2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: A9Z-gGxxE14hpksyPlMJbMmdGomT5ZSY
X-Proofpoint-ORIG-GUID: A9Z-gGxxE14hpksyPlMJbMmdGomT5ZSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=740 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140171

On 3/14/25 10:17 AM, Luca Weiss wrote:
> Define the two NoC paths used by UFS: ufs-ddr and cpu-ufs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
