Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283836C5AE
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121412; cv=none; b=kGO8fXCkjVfFxFi2bI9vw8ux7QGn4ZuS8c81Jt6YNTLqXeM3T/6nW8dPMDIftO/aneoinukpvBIDKhMnhVHBD65N6pkrIDb0O2ilpxK+5VJ3b6AmM19kpc2itBxprq9kxkaq/yZLbos9yB1RtC8b6jU0+JkpYvuzgZUUO2H/3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121412; c=relaxed/simple;
	bh=UddLCTaZsnv6559x4M4lzB8DvroWR4XY2leIquweXPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAppWalmAV+rxtbmE1J310S5y/F3woggRcvGmY85cinVEL4PmMRwkBcDnJjPhD2Z4WBumhea0/Vvt5rswF+Zq00KfH4uKVZnPEpbH1r6t/EzxdCzXsXsZBYuJ8h8wHXziSmg3gmwnBAZt++VdIf3VixCkeULlU6f6XjDItVldkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRyNNMzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nap+kkkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRyNNMzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nap+kkkZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VRK6090852
	for <phone-devel@vger.kernel.org>; Thu, 2 Apr 2026 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=; b=oRyNNMzsPc92bjMO
	TjStkDkxlvXO5Z+8RUNK3yPjI29mLdRgxJmHC6VH9K6tUqH0zQrjv0E7yDB82EVE
	BuqKfeDhRJ7zO7qKJryTIiXoesFfIJa/ZxaSt+9JmDOSvGyJMJ9e572U235DeiMN
	CH2ce/DV7lawB1+LAWQsXI9PFaHhvtVukBOd0rLKvrYIttn1YLvuLVH9UJJ5+Lq/
	vpK3wsi/lsEwzIn2aDd/oS2KDTu8h0TnxzKpV+vTi8iz90g3TGs/Ipvi9bnYEtwL
	d3+qn2h1qzinb84OhRn6+3skEH1lxBdJSmu1d9QEZG34jBM1tqwndgANeJKh1ty6
	fnZcOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8wg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 09:16:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so2621011cf.3
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775121409; x=1775726209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=Nap+kkkZZ40Ajq//fiKQJ8ZV+4VjlZ+4PD61CcJm5OLB0wmW4sFf1o6nwdFgbvWjsl
         7DZfjzq2VTraL6ZaNaWMnBxMnaS0UO2623e1IR/uaX7xtbfMX/BhTj7Ven/p+i9igRJE
         RBEr1/qoX0/gEFBTjgc6CFrbRIQWGIo8iHOj6WKz2nyhtRERrivPP0spIJDhgexP7hf6
         qsy6WuLhObuA4pcjckv8kGb+HDKYn9FvRYyKdIbUU+QL531P/biQ4PlDlWVJ7SB/5hOd
         fM3T/d1IF2hdHS5fvoCGLIZ9nkS85wr6S6mU5nYxrbRU9Xw9GaYRW5G9KLt8R0E9qjz8
         G01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121409; x=1775726209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n277EbJU/fnSTCp3XQ5yeSpssjBDshWUW3CLO9QCTH0=;
        b=rxdnqle2rg7Q5leZ8fG8g94cIeCUrQzSo3YMrblWMpFWee9kPiPpcwjD6d96DFwbs4
         6dh0sAip09IF9XuS0G0Kh3PhB4PXjZktyMA3RRpMNFzaOI0/+irzQzBxKgBKdFFOtOIe
         nT62+igkT1wVqwdOtKZ4J4oUS8lUUYjjycy9QgXXFTAiz7CmPFaAyW/LP8KxeH5Ko2kI
         dIKn6nk4SnG9JJEM9tM9hVdEe9TRzlHxvZ67rn6KdNeeBB/q0kDFPNtIQapnraTr9fzd
         FALSUdJDze+JFQtRwep6TMHOEKAoZ9SuY1kM5ZDYAj03NCOpGPWf8u3vt6HzL4sQI79E
         H06g==
X-Forwarded-Encrypted: i=1; AJvYcCXWwgezBCkbcxB61tQG5WDwGsKMOzK4ihDzBKr+ixSnuUIH6cwcNz2k164R/wOAGNmilzZdCC4RVUaSXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ctEhltRFykDkyt1uPAgNCObM1KXoTeawiBdf9c3iu4KkbJDY
	PzldByDxlBCLKRbzAChDKDEBxDiRck1egLkxyhOhTBSQo5qqSff6NytOvUT7X8whNJpvZ2XroeT
	yrK97R7pE7OYGzuB0INtlnuXYB6lRm1Au1byFUgADyQykx2zgbE/kxENJl0urPCYp9Q==
X-Gm-Gg: ATEYQzzWbWi7cB5ziu23TWmbzQx9EuzGgTb7smNXLsmhostncC05cuJ55ImZloJsn5b
	uvY8QXup6g/uY7orxMJKepZtWoxBjAyInNyEhkR9m5YxRh1O43UybgAHDwObga+GOfmxiJO5bBx
	0uBG+3zgv49PW5agu4+Dgp20NkmBmSWsZeqyIPVozaeRILG98Qjl6OvZh2xTjjAsqR/ODIkFDqT
	u7hBzenqbXDbBStzj8hExtjDctbIqX+DgaCmBTJlzlGqO2H8TIJg0B04tmJfdQUkBIdEqJ8ZgOj
	PC3liOFGJMrRuzt5Tmupuzcq0x/pTqIlut4D9lk23cOkeH8AmODMC172QyNcFRwWOuZaAPr2dQP
	vZ57tLLdtZo0DEJQQH1fg5h/UoU1Cg2A473Q4+ZmliyBZw3cayzL1T1uwe3R3kfO6nMMCP+vdXV
	LMMA8=
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474571cf.1.1775121409125;
        Thu, 02 Apr 2026 02:16:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5a1b:b0:509:2a92:8088 with SMTP id d75a77b69052e-50d3bb89968mr74474351cf.1.1775121408759;
        Thu, 02 Apr 2026 02:16:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028914sm70108466b.58.2026.04.02.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:16:47 -0700 (PDT)
Message-ID: <1c49bd48-85af-404e-93e4-4e0eeb79c840@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:16:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/15] arm64: dts: qcom: sdm845-lg-{judyln, judyp}:
 Reference memory region in fb
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
References: <20260401-judyln-dts-v8-0-cf13065e52ab@postmarketos.org>
 <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-judyln-dts-v8-15-cf13065e52ab@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4MyBTYWx0ZWRfX1E5bNVI5IQ69
 pBkBCWLZQR4v3qIPK+7Kx78qT+rM+mUYJJmGhzGqJaHH1Vg9pPlDG7wPTMjCRHybeE6mCXsJtFa
 FHWYIUQWM9OQP+UH9oB8kagt4/toxOHMNEWwvHF8F/g2o8hn/PwglKs2lB2MynPhWMAjdqxcD9i
 kOrTwSQ1WFEOlSoPjeeesZvzMc3/IF4ftE6ckZbJuJTIbRTk4jqmS5IsaJweH6TtyrQA8pRFqJZ
 t9ix8LVGFphQpS3ftB6v7qu7AE5dnLTzmw2RJIEtkrI+B6OuXt4+uTuCWz6CI72k1XcO21nMnWr
 H0WSS5bC7CLhCRms1OYpEcqr5rxVXwejDQUW65MKZJ4FSPJv6qq/p08jMAm4H6FzUqyBUipsXDQ
 S6vZ9Wdideen5cmcAyGzp75Ixjd5DtXYWoPgqWd7eqQhNDmMwBdLRHtrUzv1hGPWMKSMaLwyHz2
 yfkn0PlJcMWfHKPN8/w==
X-Proofpoint-GUID: brksnEtXy6DFbJnCvyNkuAYerhMqTIJz
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce3401 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=Fern_NpIRorMR8BevXQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: brksnEtXy6DFbJnCvyNkuAYerhMqTIJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020083

On 4/2/26 8:43 AM, Paul Sajna wrote:
> To prevent duplicating the framebuffer address and size point out the
> existing framebuffer memory region instead of specifying the address
> manually.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
