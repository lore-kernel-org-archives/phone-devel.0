Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9A233149
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530776; cv=none; b=d+XgjhZw1lz5t6vcx1hbxma/uqVi7MkMVhonFRrDj2K2QFguJEwTrXNLsIXi1RTq4O5TUnXU9+yWagB6PYB78UubaVui44/ZjGfTTTRR/NwxVs5FLSTUFOf5tLfUswsn80nsv0DOQVi2W9qHi/v7OF9rXxaYaEkQW8W4ioAy2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530776; c=relaxed/simple;
	bh=Wp5uo1kEWsoAlDaB84RI1CZfMuh7FTkZNljPadpndCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my1RtgSeoxTZ2Dw46fwy3F0RkKXMlPQsZsfefh2bz0tQkg4R2PfIoTwZORzTnJvle1zzWRRubM3kxdoOdhd51mIW4mZjXtGMC0tYMwOtUlbKWku+nxciIZwGk/Op3m8pIGGofNP50v1KyHdPDZzNO51o5GBKsM0wajGFeUVgWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMXNrOQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSJaPWR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMXNrOQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSJaPWR9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IDKrQj3082932
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AemAHZIONmX9Bx4hX6o5KMIh
	YVIU89hnctinbw54IEg=; b=lMXNrOQBbXNP5YWXpnI1rhoOIHnhDXKWzmvN5xcg
	fJUwXTY9lNj2l78wpeMHLHglBiWkwF1uaMJUjbVbEkhqWUrS8kItPV9vRwe1d1Oz
	08IS9x3N4FuvrV+YilWYQ2tw16vVo/eurdYF2FQAbTwRIJIMO4c4BTRLwohpRFGG
	0uX0K/vIXF/7sKZnsCF6LNYmnSEkq6+S/Qx5iCVM22370AFTWHcypdJE9hrSelyI
	/OzeMlf8a6zvPZyqMySHK7oVLNSd6gbSodPqAcXJhExXOliA2vl4obXJ7dRS8Ieq
	ikCPd7U4BvtNea9NZGC0y+ktA4VmVq+nBbk5Ux70K9zTNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y619b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:46:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d984c74a8so39765851cf.1
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530773; x=1777135573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=FSJaPWR919mymUASTA5baUc9HNWaLL2lU89VDOUxMCPBFVEq0g9K+xiLy2sfMpKwT+
         dkDzEA5CGT+13D6UYii8Z+k6xh4LtR10Lb5i7/H5/f7Q9cl48nIJo8ChxdIyReyZIvmU
         WDMO72KTv5sLtqg6ejtZEn8EbtBygMAnydp3vL+XHI1c7LNnTA8wKvMqzhUZ7U9ozSsd
         QNOmzN6+baHeomOatIkWH1nBC6odetApZZTYdOBe7Kk8FC2bDqmwNk79lQF9WDtb6NoQ
         cO8S+Tl/AFn5V8JZWhAOjd9W8pZuQHqOaIM9pFI4iJ3w4yIqFUJelJIHzLf/vXx5hAxG
         5O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530773; x=1777135573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=RMB8P2IrxAsq7Kesd8wg635JYTDxyipEh06ZZAyY6NV56kBtl/V5ewTvLpTBa7amQ1
         k6WNIPsEYB8rdy6td7WIdu+oivX195Y3K6ZZvSV3u1wC10X3C/gJsGL+R1iXKzReBL97
         rzyuL+IksCZnu/r00NGDOs/cT9jYHs2Yec7bsmfITmzJE/R5tPtx3T9NguI2Yd6qpIMU
         m/uM2lO8fKwEz5msVP6+iPcPtmJdLx4TF/rdMkdjw5rELDDFzrxq031tiN/2s0DTbehW
         ASutmAWBXrJUmFfbI+r4oEmVF/a1wC73SLvF7ov6rU+hCdkH5WUVnTjURAtq1vaenCb8
         39fw==
X-Forwarded-Encrypted: i=1; AFNElJ++koOme2837Gx+CCX+paNT0ZQKXX1BT+cOAXCVwFcMz4ncfXKE0WmwOXVWu0kxNfgSNR/XpwqtFHdXPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjcmkpBPBqdH1LSrEaelMonvKzDZlhWVrg1vEh858S1ooY0mh
	Oq3k6Wv+YnNT+j7mDlYdsmrzVAkKEJpntMeYmZK4BfQtmyFKg5qm0PL5DCSoLShFv8fsMoZJ3UK
	XwrefttoU+MkAMttiiByEi1+jjvRH/N4r6jI+bbj9LZJBzjeX6xTCICgUN/2+N11W3w==
X-Gm-Gg: AeBDiesrkjpsSdPUxwzScbvK3DWO7Dbvb+TsqoOcRLbldN1y96Ueq9uCvzazI9aiqEt
	Lsp1MKsOpD/AOgOb6YN2Qd3mCY/2Ikh8b6Lzgdh+MuFdHuGKrEz/TPcUrYnYN/dwxJsllDt/yiL
	Bto8wZ2MhoC6d0HV1KhhNNYSXjZW6HTjWmdxE+CwF44ahEwTSUXPwVkgz2/SsuVSO3YjIJp5Iw/
	K9m443iTuy1NBoRYRpyqbMwdbYL/RZWlzu0h06tHoTEi8fU6AfxvfAvGcbA1vZi1D9wNgQtH5YU
	4Le1PAoztYcqNw9GLo0+6QRrxhrukymKJ+0NB6DH+Nn3G2+iMnAQLb+BAB7llqgIgy6WoBwUK0a
	b5eRhK5ACdKxBFW0UD1J8jEQ1TOkrVXXx+qinwjruBaAJ/M8Fe2Z2m6LkKyxNzu7WHbwD6S24FQ
	OvtOoEElztpL6VZNTgNdBwBY8fo9FBZ6sNoMNxLBvvt+m5Jw==
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952921cf.29.1776530773236;
        Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952601cf.29.1776530772833;
        Sat, 18 Apr 2026 09:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm1448060e87.82.2026.04.18.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:46:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
Message-ID: <2gydufud7lykeselo7yca3n5jydtbzephhjcpm4ek5i6vj74h7@b45lfcheohsb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
X-Proofpoint-ORIG-GUID: TrQUSiYpyye89RoRiHaW8hggLauv9TUD
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e3b555 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: TrQUSiYpyye89RoRiHaW8hggLauv9TUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX5nLmiSkr+YTM
 mQ9216gxFFcJqIY1hs9SltkDv6hYXLzTyNQCtRs4mpcjtI1S2dh9g3o8JZEWv12Y4ni1ijtA04Z
 M78JdRqdJ1Epzr+EbtTaXu5lwVlSmNCN78q/4jjoUHZwlmvA5FpZJLKqL7xAubFM/AJwAVLLfWC
 sZxEKs6UoukpjwwOxSXo/cqIz6ggV0XLcWgvU5wfDTXQM7axChM2srbMcP3bBttCdB+nEFG5Qjz
 h0wnedZGuwb1U/yvEzzRPQvfRPRjCW8UlYgFOq7NUiidOkUWFjNdw7lspUxEVcsYLewFqg3Kn1+
 Q0ZxgsQKfLPV/MScF5i1yTktPr74iDLI7rYMKzGgXE0b9vB7Qiy3u2avG39OChCxO36ya66x2mN
 290iFxmTc1BedygefRTTEn79taQ0IBQ02vP2QVhycA6a2loUYG1CJOWsYtCV8ghx2LG2+NTe4di
 AMlOH2j007TOl8jGIng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167

On Tue, Apr 14, 2026 at 01:55:34AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
