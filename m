Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2734B195
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514859; cv=none; b=gA2WOce0hmWbdmM3OMkfPHUrRGgY1mvwhiOeYpSVbpypINH8tLrp9foXiPJ7X1KHGAnqstMwwXENo9qCxLVxkPOn31+j5zI3/Gay+bkXJZHuCgEQUuNKmaSDXvEe3b98SC8FhHJIb8WKWcPozrsJSQqWb+RV1qzgu/RfG7OlF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514859; c=relaxed/simple;
	bh=9eFDs61emi4sfTHgfT/aGOzHu+flEQ8b9nh1vAFK02s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjRYnrER9O1BOek1m6rdjOgjfyJBU0TSvjQHQc25wawltPyevcJZQq/0f+GFl7wGRbop3LZx2frUvglApNQM/onfLlxexZE+lxV1VeSFfmi0wYbM2j24waqTbO7WkdHXQcWzvKLkp/7DCzjZ7+hkq4iUlcjDiHwvmNIlEwBYVCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt9pZ1kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuQg3IGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt9pZ1kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuQg3IGM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87JoU2379266
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=; b=dt9pZ1kqLuyahlwi
	OSa5CtV+2V/l522Hg5Bqu605oMv2Zm6Lc2lpdEVpMiI20dUgqOxebQ0Vam3q9bnc
	0/gkxvXy9OynFjXpk5aK3MNHTP7IM+tCT8L7iGS4DY27u+OQofYaACWk9I5zZMJ0
	yQ+mnuAfHAiBs3kX4d9vGRuCoazx2CPww1JNBExhzCsC+HRMOlUa3QfObNlMu729
	VTVVf9wKTBMxRp1o6ukZWbbjqZIZN9J+CtEosZGSgB8sjtmMyxgVXOeJf1C906FT
	qCs2kC0kES3rJ0/Pe6n/ZcJFf1OVMtMx8SoM2qOiXrV4J7TZpNfxSF8tIeGCK+xO
	RBiy8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8r2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 11:54:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5029a8193c0so14089571cf.0
        for <phone-devel@vger.kernel.org>; Tue, 27 Jan 2026 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514856; x=1770119656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=;
        b=LuQg3IGMR++QAcgb9Yc9+TN0+zdF/hGRUTvBenIBV3TrTw9884DgebgGUI8DeX6pvQ
         zni4f2ntie7OsN8lcHnSXcvfYs6sCJLiNFKehuvQzsDN54rCMc4nmJkNy2f+Jjcfx+mE
         mjOOgmCuKzs4v7MWeuc10afmlnGLJD/EaR7elyXeZ50QNCmZeqcNyQRMTD9uRO3j5fr8
         KE67D1YuVAC+C4UHWjsI1OW+M1fTkbuWjfbvUcojNgX8QLNxX+oPERW8wkLpuF9wJJKg
         Cn+q5HAx0yIjXVC9M42SatkBe+PL4KflC2QSz9fk5Q2hbBTUpSnXB8ux4SmYQ8OhS1oC
         qvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514856; x=1770119656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wnf8iBeyskshIVYJYndhWW4y/eBQme9JrGBpWCNWUSU=;
        b=mfs/c4LRbV3e+FWlpNnQJliNOMYCHFAovIWwd/VOspRAvHVCVq75rX/+BUEtE9kFGN
         +pvJrhmHvnUYZyDLnx7k2mGv8AVnOmM+wyMC02P+G0I3LHDFBTWOtTBrUuu6ZiWMooWY
         gtB16ieWqQW6/Z4Mk2ChTm0vOpyRDeOgohzKB/GX9PXSWm6e+rQZqWSQtg8bBFgN6f7y
         iG/f+WxD/SwMDZcvn6ZxRQ8r7xwSFNmUR8o12yZ2P7x8sFBvcG+u6hS4w1PsvDqy31p0
         lWwIcuGkuR7qW+N2NmNG54VB55fC/ITQehAs/N3f8RwrPrISOXf/928mkTofFsfRkEVz
         FfkA==
X-Forwarded-Encrypted: i=1; AJvYcCWWoCW3hkv5kfzxOT/6wJhaiZ5jNvoQI3URXX/C8hgiqPdCy8GAUMvvenuMtQrC8j850EXyFTLecvxweg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXx8o6ec3pc55j1xYG+PL8jXbdaMpllzvY4r1O4NVpTgwsyqyU
	ELnkbFetqKk7NR+KcpidE+QlHaeDDFgRek54FO8fJzTmhZQFT0MDqH7T9dG6BWoOz83nOwLQmJo
	4davFtzCAgm7M1m6U/AOOSjc6VvviP5NWUHhlasTeGXlDPI6lwxXUGN74Q1ovKKr5tQ==
X-Gm-Gg: AZuq6aLSyK4QvQTNhL4WzU6T0IphvgYG6gU2036M1NWQ8XjXwzac75fLzl4PccYt8kW
	HJ7y866EfKl5IrVGOixLfQUUuoYyN5gloP4xJ/UFbhD7lkUCUR9ubTxBfolRdKVQm6gYmEgyMIz
	zGio8dfxijX9u35PoGjEK/lDlUnOA5sUPgiQAvXeK3QeY6wsDfOCq9FnL7GUGR2QJmEqm+mVdal
	/FFmgfLV9iKqDt814FmWwxXu6Sw7XDS12obcXRuXUrcidexkyYdOU1URnXZpauPe/PEtFEI/yfy
	uqIklVR4mE1WeoBWFbcQP0o86PH0MoGwcbGWxcbOboH/Fy8ZYpnpfXTuDyqpDiGZSBK3FvWuGBN
	bdpEHkYwVttNVfjHH9GwvhZ8oVDplbtGn4AZhX7nH/5cZcE8/EVeLRIFlSbxF8YRdO2c=
X-Received: by 2002:ac8:5f06:0:b0:502:a0cd:4ca0 with SMTP id d75a77b69052e-5032fa0a876mr11839141cf.8.1769514856032;
        Tue, 27 Jan 2026 03:54:16 -0800 (PST)
X-Received: by 2002:ac8:5f06:0:b0:502:a0cd:4ca0 with SMTP id d75a77b69052e-5032fa0a876mr11839011cf.8.1769514855671;
        Tue, 27 Jan 2026 03:54:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3f6ff8sm6356227a12.15.2026.01.27.03.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:54:15 -0800 (PST)
Message-ID: <1268a87c-a2c1-43ae-b99b-3940f4aff63b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:54:12 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set
 memory-region for framebuffer
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
 <20260126-xiaomi-willow-v3-3-aad7b106c311@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-xiaomi-willow-v3-3-aad7b106c311@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bkZzQoRsrxsswBY9q4H6TqB0nH3ITz8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX9VFXH4sJdvRH
 rBE5yYmXtVqO61Hp+436xvlcNUGjgrimcnbdsd6fu7j1h7I2WQjq+0x8LgLLMFb58DAhfLoZP19
 uVFOO1CVpICPr1nwtpwfXftCPhR8L3hug4H7adu9njJpJYS+gZ6VA3T1ilifTCpIBDuMEoZup5t
 i2+faS2k4PmD+iEpRMBVrKwBkgUCUVkJ6LTHNo2BBxw8mVfwKWC9HHQQaat0htWX/OLX5W4ANW0
 hZugSuaAcJU9YHogwV5lWXwrc+QN9LlSmPSD9gYW4yyhzn+V88FEFZh+ssQnawd4OU1P3a8+KIJ
 CIbr6VoDlKKaKh9KDD3t9bVz91CqmnAFjNkeIOORS+mv0cvuSMszaofgEuqdjHEFMKGCewx/rj1
 S3Kt0yQanYtSa6C4hKPbJturYCvet6ECnvVh9Nv8BZ6RyOjLV/hslclxuhzNMPhILxIS0h9+Buk
 ubJda38EjW4X9GHrGLw==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978a768 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=xgpo1DY4mcIGgMJ4Mc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bkZzQoRsrxsswBY9q4H6TqB0nH3ITz8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096

On 1/26/26 5:34 PM, Barnabás Czémán wrote:
> Use memory-region property for framebuffer instead of reg.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
