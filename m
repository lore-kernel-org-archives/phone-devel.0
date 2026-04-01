Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D493E316C
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038614; cv=none; b=kgMEg7CA+zqK8Ylzr8XrZ6S2GgtUXHsmnBMwSkhPrF/Z7IbdWZB3u4YCcL8Ss7WcLEo5rpqmmSIqYzLC01vfMxsIN496VRDyl5fFCRT8aAohpRAmMz9kri3Ux2ykC9xJJWE2LdEtgHnbQ0cMPXn1QG3UkzA272gPq0AqvRPKyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038614; c=relaxed/simple;
	bh=KBXycPxrmm22Jcm5v3U9Xn8DaZXKMm8JRTL98/PJbgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USEshAXIXvSQyipL8qWL6vj+hRHmJG69+4BHGkqvTqwsypNwdsOjP455x2gkXBYFKrV4le7GtZt0oOk5OwbU7pClv9rigITsmE0XlbGd3WVUYcUhJuY1NvL73K1kbwAEQZV6aGFel1Te+1CBt9eLAFtfXv9RHRrhVSa7D+XGH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipIgZFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fvk0hpCT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hipIgZFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fvk0hpCT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317dObP1578311
	for <phone-devel@vger.kernel.org>; Wed, 1 Apr 2026 10:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=; b=hipIgZFA+kNbvTtp
	mZR1XbTWGlMZ0euMAQk4acIN7vwobre3/0c6Sa5kKI5ehDi41HCmS3hoiKqpO6mt
	XWqamUfc3JYvFpXiepWFO3Yy+t6NyYS2NAe0MAwUH8XaUa6RVkVvyeFk2wdgIlog
	S57pVJM7fZDN+BfNKBdeqQgpdCE5fXqKVBYNvrPLqjxwnMvbWrMHm93dlL12mt/b
	dpb0a/PgvUNlu53V4TqrC/tXwqFfLBAy5ZDwAQ45LezR8effIyFFLj15g+EE5GMP
	i7T7cjqV3vERqjVy54pfXgMTbFnNR0YZSHWdky7J60Q7J6cKswerj554cZ0GoFeU
	fxnMPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kuhb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 10:16:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f3e41fc17so18274646d6.2
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775038612; x=1775643412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=Fvk0hpCTJFSGLq1t+9sJBWc4AJINgiUOOKLYzxO6lZfHrRJ+M7JW0LbjR27JtrTEyI
         U1lHEAFwLx58d0GsUg+HknOBikRAaBCzXTrlALQ3WcHcfrsxxkuImfpvmTs/s0nelp8B
         6yVGBncK6/JbwCUWeljzQOTwIlRd6nGyjCvHRqkO36Bxm/5ToQ+aTXcDuMEqlPF31Fx0
         ccR0/6k9mEOPbdWmFQUW8GHjFVoagEQwacOmhYJhpl26885C6Vmv1VV/Xoe5nxPFBDsP
         K8MtJJ6Qs0RneNBZL4S1xfg0vAfbMn5P9d1oUkwFRIDBjEOv96oX40T2NgcYBKWbAy15
         oh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038612; x=1775643412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5San9duOFtJ5qhLmPPDELhjDDBAg/h5x2dywfngs1QE=;
        b=P6Xo9+L5FHHeMjbFbapeRSFtsRYv21268o2Rm+BVCFJnAHz6RBrTianzR41VItxDH7
         v1oZLPX/r/1i3WA/+akolgftJVWXJoV4W1wd0gpdezuqt7ifdw9JEbtbphfcmqNRwQpZ
         Rm5aAivyPxlrYJI5MlkbVEIyW8DBJg0vKNJM/6tdFuNTBO3Pfpt6nS7USc9WgpZ00Uu8
         agl/NV0uAhkD56Brc9kRjpjemA+LMq4xxjFKo6YhxY6dGCX38uJLrLzC/e992sh1W1NJ
         kghEsGiuGAjf3aWkYWmZeSt5SOfRCIXifOYPIosKKKEHB3KN2PAFSj4OcrsP5NICVUJD
         k6aA==
X-Forwarded-Encrypted: i=1; AJvYcCWJp2FrJDCCnZ5orw/jNUwKxv5u1TgepwThjBppAYeIdHoLNhpSZybKwZ5P51XDUa9Os5WD6GYJ9Pkxfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyJfJKVSpxJI6MAdpN4KvQQVNUOYecM1EpPA+Mzqe4Tk1W8c3
	i+CmkJnM/VmQBJqGw8VGHVoL55Jp7ZAkQOgyKfF8Ypa3Rm8yVszNK1hliVEF/XYj9PZIH79m2Hc
	A6TV2TZax2yluKaDbVK1p4mIGVEpLj0D42e9FI1wIMZxOMBZqFAV0G+MDi3YaVVlI7A==
X-Gm-Gg: ATEYQzwzO6+Te4+bHmclY8zxQq6XDzT7HHARAv2JqPfMqRl1j2BQBh1WR8gz34hDABA
	Xt5tWO/JQLPkfVByCM/F61VlAaG3VYXnCLO8sRkPFGTgDP4kRraimpw4PO809z13f9YiCN2z8o1
	90ynNkZllKkEyW9Ek4dBuTn5CA004R5vn3PWziyjS8XN1oOondiivnf6fcbk4ywjXIUkn9Fxueu
	NgYkggDceedsVf690VhoXFwefaEB8DdNC5/UH/0UApDN/XKe2g6aYsyXPHpuZ1y+3ARr3zLtwcd
	6P8rLBlooRrYCOnAQemMoIAjN3L84xDRgSSqD7Q08z2ag9Hvh0l/8DuGAkETf3r1A8w+oJNCSc5
	Tj0XQLb50fyoZA84zseQa9tTjVEG1td2KtxiMYJn5Sv0B/PBELX3Pkbd5ztwcAAktSkIE5VSvYu
	RoJUQ=
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30208311cf.6.1775038611994;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
X-Received: by 2002:a05:622a:11c8:b0:50b:2875:5782 with SMTP id d75a77b69052e-50d3bd372c7mr30207981cf.6.1775038611558;
        Wed, 01 Apr 2026 03:16:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1ee612sm504969766b.53.2026.04.01.03.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:16:50 -0700 (PDT)
Message-ID: <f07b4d80-bb82-4ab9-afc9-ee06b48318a8@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:16:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
 and their dma controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260331-judyln-dts-v7-0-87217b15fefb@postmarketos.org>
 <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-judyln-dts-v7-5-87217b15fefb@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69ccf094 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=IQdlk4_VRkkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MyBTYWx0ZWRfX5UWN/Z3Q8Yga
 pWXkT2IHl+eIinfrVe4GZDHIO1zXAauqXwgtXMhMYESELkI+eDgC7LWTalk6/4JVJdVZpDNXMWk
 zMuyg/mco/nX8Qk6121r9gLxl95ZbkRkjjBcYE70Q5VAilq46VU0IRDXXx2tLJnhiLnN3sWF+5r
 YOryBzPLtJAffbXjMQUE4cye8XUVQDQsU4l3YTnhu13Gc+rd8UtM8X6TblJ7X5znGTSEZZ/3+3w
 EH/aARSM3Cy2iYx5WRiepl9glxe1ETvmchiYqNExVJd+Igcz3fOmPNO+ICi3OhDiAMG9s3F4H5O
 bZvrmB+ZYFm895c1l7uV7/vR7RZvPgkFrky+0L4ko0vKZT6eCl/k3AzAFBlXMNus8ElIC0HhRv4
 nWYvJZ1pilKChpoEFllNELSdtu+PoKSWdOjZygZfTOVs/3bpMmIWBstcvGiKFa4olg2II1dPfpc
 5JLmRnsuw+nWOURoiUw==
X-Proofpoint-GUID: 1QstmN0kphzcEF8-LTuxQvIeULVD2NK8
X-Proofpoint-ORIG-GUID: 1QstmN0kphzcEF8-LTuxQvIeULVD2NK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010093

On 4/1/26 5:15 AM, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
