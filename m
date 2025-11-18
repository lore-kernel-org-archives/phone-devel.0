Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665C35CB8D
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476346; cv=none; b=kO5ThiF8mhwjtmlFrK90hNTPvkP7AF9Rplxu4U3aBDBeeXVtVR3QQR8gUDI5c6DHGIEaUfn1iZ7mWvQqBTeBEuAWycIRuJWmryslsJSgw49aNcnqK/3+F1v76Fa7CBil79fLiyv3omtyMbv46cCA0/4jvYACauk742ChrcUOzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476346; c=relaxed/simple;
	bh=8RhPzsRzALU9XX24Ra/bTl3MRvJ5zAjKxYXGWEXU0/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJpXB+zzlKy+hBnvw/lOkIeE9Y3S98ieeCFNHUp2pvjqgcCEm2wsIoB+nG7yqccUQXoCbe29jY/bXI6auX13EuJSl0DSUzkaESYBgS8FpWnxfPBY8iy/4alEuAjKG9AhwDoQhcTJsDln4Y8OVGzs55S4DOk96g92yMLaaGHh5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO6ocDM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9RQcX4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO6ocDM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9RQcX4Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICApXH2802314
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=; b=hO6ocDM1a/rsD47/
	RFl8oMy6DAaLraajt6gkHGgVezrchrr0fNIJGvCRb2ZaLu28bj3YOXJani/d2jzD
	v+rBtrkkA/RaEVCbxequ6yVTz5k46GHZfuMPi05WV53ZBS7r9m3GlU3YDqjnEtc/
	lB3UUUwiI5uB8lCOP+tyJD9k9D7ic2CEp2C4vcQ+QP1f54vftfOib+bJDL/856zZ
	OTvpz9tQjjRc4h2d+WQNZ/W7fZBWI21iwFfj126+8W3y9y5iZII1nJy07ZG4k9Oh
	3MHx2lMMSYS+EgdMB+wK6CzQtgRh7PVUeTVcNnRmEG1Uu7wTVxPeUO7l1XwtDEFa
	/5c1Ag==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20bua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 14:32:23 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-559ab9b8b24so660170e0c.2
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 06:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763476342; x=1764081142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=;
        b=B9RQcX4YXhdms8WmgF/K+jKm/0nOv7sI52MJhtCj8IjXX/c/H/ahz6VvBi7/sLEpMF
         o3p28f3D9UtUUhVEeER5OMuJLp96qY+8hJ06PMtVebu1tE50EeMI+gOqyDVONNXAL/76
         lIpPoDozlsf01E0NwpR7MMRxNub6w7cEyu9mYIuGcg035FN5Nfxujn3mp5dFsmn2RB3e
         ngU6IZ0B+2vSzalyPwVHYusG4FV41p1gu3/spNQpDrSvUz08ac1N4QAjb86XGLuGOTro
         qxCVx+6jnrw2qxPXvN44ePc5/EMQ14iKSerZbjeaKXpRnBZHd3m2OtQqhlyxwBLG20rR
         lpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476342; x=1764081142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+H81D9tm/ogCtYv4UIOH4p26Sjf9mRjnSMPfTGzjNE=;
        b=VU55YFm/QRbdKvUdlLaK87CsPaGABDeifRSbRYeGkgLu8VVMEaFeCOVinQFuwNYf5h
         Z7qkneLSw0TybtloztfHbQ1zQURYimISlC/CxPY3zjGmw3cOwPLsfcQrEyultznRumGL
         HaMAsO31FdcAdjz77K9/udSy18S/3uXIOV0HhAA2OD08BMGnXlrzgAxL7t2s3emdcikf
         fEeGibahKyKlTX29O5Sl0DeUo4Ng7zatbQKmWVbtVPs+S9HLVxMzjMbVkyw/B0M5rR36
         2h+vJwmQx6yRCaRvVxKsi92N3kbss3/IGd2ZqJORTzJWgiNOiKFQJSwS0zoCniTjUpOS
         tBqw==
X-Forwarded-Encrypted: i=1; AJvYcCUVyu36zF0ijU3c84rnU5DT45+ukZpVn0YSNZ7uo1Ct8fO86ZilW59ziROWpO5wsig3fgkn6FqgAOjAew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9CrEzYtN/rLmI+sD/5mbV6OD2kB5R9KM80bMiHHwAWaiI2An
	qn0hqRpUb9DWHwIm1I7rm4/cTvn3STEQFFOHL0GpF5oMYx2+vyFE428JhRCF+JREpdsPzcFHt38
	ptSg4mDN0o+7+MHBw8adMoWifEW/EIwCMo2+EMAQz2yyZLNuYdXQFoDfpHgieMVyzNQ==
X-Gm-Gg: ASbGnctz/nqXefPYLanEUgpTNxnxGo+Vr0/1qnVlYqr9MHFcMgMlVSovLsCcijnNvbg
	0MT8HVxlhPkPzHGmKLpwOONRrBcNniS07T7LXt+BX1NGs1kU4pRkD1MUpHtSWf79q/qnS1VFfIx
	0AgJeNE2Q9B6cg7wKA8bGOud/xOSLsf2nTtqMRJiQuW147+3mGbVqQB3i1Gue9DWnnZLhMGvmwk
	VZakt1uuf6/u+HgYZDGWPntjEPovv+UIgqqMBzbhdUzlvSuTE6v43I1kLzyaoLeKqEyvBkKdpX9
	d7JbbY/MxNyJsl7toxTIhVlsZbXR9GPVXYLrcyIhXXJawikm3cPg3z+E8L0wqagcYkCPYzjeFDW
	lc0FK1BZ++I8xaYf4LWq4QyuzexKGao+na8XKo7fBQOzJ4IxJ9qtO+a+fZr5iBiWC+BU=
X-Received: by 2002:a05:6102:e0a:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e193d0c0d4mr394739137.7.1763476342474;
        Tue, 18 Nov 2025 06:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFo+F4jj0zEA0JoBK4MyQq3HW3oKvu9IbH730uCEpz4uJ8wZN4B/oo/d5FeD1zHfduUN+Z4KA==
X-Received: by 2002:a05:6102:e0a:b0:5d5:dcc1:3bb1 with SMTP id ada2fe7eead31-5e193d0c0d4mr394725137.7.1763476341963;
        Tue, 18 Nov 2025 06:32:21 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad44b4sm1380994466b.28.2025.11.18.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:32:21 -0800 (PST)
Message-ID: <4da03f13-1e45-472c-9435-95156389ba83@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:32:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-oneplus: Don't keep panel
 regulator always on
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20251118-dts-oneplus-regulators-v1-0-79fb2f0f253b@ixit.cz>
 <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dts-oneplus-regulators-v1-2-79fb2f0f253b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c8377 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=b-4XwQHDJI6FaDr3APsA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Jb46Qd4_VpkE4Xa1XT4aqdjd8ptHFYjH
X-Proofpoint-ORIG-GUID: Jb46Qd4_VpkE4Xa1XT4aqdjd8ptHFYjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNyBTYWx0ZWRfXwjmntJ1NJM++
 UbRewW/eUWiOBTrYQD/M0GUhChYBDSdoGMphcd1Xvi5/dOXBw2Uj2ag8N38Jn11TwXJ4cfWId29
 V/L6ft9MaTQ7qHWkJZ62E/FRnlkDyG5Co0IzWkvTB3m3CX/I8XbYf91Or5nuC9PMFafrGq4ruG1
 uezi6juocSZ2udrwDXlWp0tLYUNDj3HJ2D/2AL2FnNXoOmlw5zlOH8pkPJDEoQwFRwvnx7Cj8yX
 2OcWBk7eu1OR5U2mrVtElESV2slvWnoDeHQPNLSNWB/jRp2PBg8SbunMWZAhvak6nfjWqTvXeSV
 pSvX+QmCylYRtclzuwLZuZjpHrH3jIttzUHLEEiooyZkfbKNClmjGfV/6mP5AHwdwIqikcaE6xL
 0s+Tz7WUMUdk/DroMG1XJI4eQLkeZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180117

On 11/18/25 3:11 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The panel regulator doesn't need to be always on, so remove this
> property.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Fixes?

Konrad
